return {
    -- 'dart-lang/dart-vim-plugin',
    -- dependencies = {
    --     'thosakwe/vim-flutter',
    -- },
    -- config = function()
    --     local g = vim.g

    --     g.flutter_hot_reload_on_save = 1
    --     g.flutter_split_height = 15
    --     g.flutter_autoscroll = 1
    --     g.flutter_close_on_quit = 1
    --     g.flutter_show_log_on_run = 1

    --     local keymap = vim.keymap

    --     keymap.set("n", "<leader>fad", ":FlutterRun --flavor dev -t lib/main_dev.dart<cr><C-w>x")
    --     keymap.set("n", "<leader>fam", ":FlutterRun -d macos<cr><C-w>x")
    --     keymap.set("n", "<leader>fa", ":FlutterRun<cr><C-w>x")
    --     keymap.set("n", "<leader>fq", ":FlutterQuit<cr>")
    --     keymap.set("n", "<leader>fr", ":FlutterHotReload<cr>")
    --     keymap.set("n", "<leader>fR", ":FlutterHotRestart<cr>")
    --     keymap.set("n", "<leader>fD", ":FlutterVisualDebug<cr>")
    -- end
    "akinsho/flutter-tools.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim",
    },
    event = "VeryLazy",
    config = function()
        vim.api.nvim_set_hl(0, "FlutterWidgetGuides", { fg = "#303030" })

        local keymap = vim.keymap -- for conciseness

        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            -- set keybinds
            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

            opts.desc = "Show LSP type definitions"
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

            opts.desc = "Smart rename"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "Show buffer diagnostics"
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("flutter-tools").setup {
            fvm = false,
            widget_guides = { enabled = true },
            closing_tags = {
                enabled = true,
                highlight = 'LineNr',
                prefix = '>> ',
                priority = 10,
            },
            dev_log = {
                enabled = true,
                notify_errors = false,
                open_cmd = 'botright 15split',
                filter = function(log_line)
                    if log_line:find('ImpellerValidationBreak') then
                        return false
                    end
                    return true
                end,
            },
            decorations = {
                statusline = {
                    app_version = true,
                    device = true,
                    project_config = true,
                }
            },
            lsp = {
                on_attach = on_attach,
                capabilities = capabilities,
                color = { -- show the derived colours for dart variables
                    enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
                    background = false, -- highlight the background
                    background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
                    foreground = false, -- highlight the foreground
                    virtual_text = true, -- show the highlight using virtual text
                    virtual_text_str = "■", -- the virtual text character to highlight
                },
                settings = {
                    showtodos = true,
                    completefunctioncalls = true,
                    analysisexcludedfolders = {
                        vim.fn.expand("$Home/.pub-cache"),
                        -- vim.fn.expand("$HOME/.asdf/installs/flutter"),
                    },
                    renamefileswithclasses = "prompt",
                    updateimportsonrename = true,
                    enablesnippets = false,
                },
            },
            debugger = {
                enabled = true,
                run_via_dap = true,
                exception_breakpoints = {},
                evaluate_to_string_in_debug_views = true,
                register_configurations = function(paths)
                    local dap = require("dap")

                    dap.adapters.dart = {
                        type = "executable",
                        command = paths.flutter_bin,
                        args = { "debug-adapter" },
                    }
                    dap.configurations.dart = {}
                    require("dap.ext.vscode").load_launchjs()
                end,
            },
        }
    end
}
