return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        'nvim-lua/plenary.nvim',
        'folke/todo-comments.nvim',
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local todo = require('todo-comments')


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
            }
        })
        todo.setup()


        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        local builtin = require('telescope.builtin')
        keymap.set('n', '<leader>ff', builtin.find_files, {})
        keymap.set('n', '<leader>fg', builtin.live_grep, {})
        keymap.set('n', '<leader>fb', builtin.buffers, {})
        keymap.set('n', '<leader>fh', builtin.help_tags, {})

        -- for todo-comments
        keymap.set("n", "<leader>ftd", ":TodoTelescope<CR>")
    end,
}
