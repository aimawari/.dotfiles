return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-dap.nvim',
        'nvim-telescope/telescope-ui-select.nvim'
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    ".git",
                }
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    additional_args = function()
                        return { "--hidden" }
                    end
                }
            },
        })

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        local builtin = require('telescope.builtin')
        keymap.set('n', '<leader>ff', builtin.find_files, {})
        keymap.set('n', '<leader>fg', builtin.live_grep, {})
        keymap.set('n', '<leader>fb', builtin.buffers, {})
        keymap.set('n', '<leader>fh', builtin.help_tags, {})
        keymap.set("n", "<leader>sn", '<cmd>lua require("telescope").extensions.notify.notify()<cr>')
        keymap.set("n", "<leader>fl", '<cmd>lua require("telescope").extensions.flutter.commands()<cr>')

        telescope.load_extension("dap")
        telescope.load_extension("flutter")
        telescope.load_extension("notify")
        telescope.load_extension("ui-select")
    end,
}
