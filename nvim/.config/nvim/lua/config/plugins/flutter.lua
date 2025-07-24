return {
    "akinsho/flutter-tools.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    config = function()
        vim.api.nvim_set_hl(0, "FlutterWidgetGuides", { fg = "#303030" })

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
