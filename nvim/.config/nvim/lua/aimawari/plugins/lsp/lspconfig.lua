return {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v4.x",
            lazy = true,
            config = false,
        },
    },
    config = function()
        local keymap = vim.keymap -- for conciseness

        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            -- set keybinds
            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

            opts.desc = "Show LSP type definitions"
            keymap.set("n", "go", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

            opts.desc = "Show LSP references"
            keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

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
            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end

        local lsp_zero = require("lsp-zero")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        lsp_zero.extend_lspconfig({
            sign_text = true,
            lsp_attach = on_attach,
            capabilities = capabilities,
        })

        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- Automatic server setup
        require("mason-lspconfig").setup_handlers({
            function(server_name) -- default handler (optional)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end,
            -- configure lua server (with special settings)
            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = { -- custom settings for lua
                        Lua = {
                            -- make the language server recognize "vim" global
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                -- make language server aware of runtime files
                                library = {
                                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                    [vim.fn.stdpath("config") .. "/lua"] = true,
                                    [vim.fn.expand("${3rd}/love2d/library")] = true,
                                },
                            },
                        },
                    },
                })
            end,
            -- Configure clangd server
            ["clangd"] = function()
                local clangd_opts = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--function-arg-placeholders",
                        "--fallback-style=llvm",
                    },
                    capabilities = {
                        offsetEncoding = { "utf-16" },
                    },
                    root_dir = function(fname)
                        return require("lspconfig.util").root_pattern(
                                "Makefile",
                                "configure.ac",
                                "configure.in",
                                "config.h.in",
                                "meson.build",
                                "meson_options.txt",
                                "build.ninja"
                            )(fname) or
                            require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(fname)
                            or require("lspconfig.util").find_git_ancestor(fname)
                    end,
                    init_options = {
                        usePlaceholders = true,
                        completeUnimported = true,
                        clangdFileStatus = true,
                    },
                    on_attach = on_attach,
                }
                require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_opts, { server = clangd_opts }))
                lspconfig["clangd"].setup(clangd_opts)
            end,
        })
    end,
}
