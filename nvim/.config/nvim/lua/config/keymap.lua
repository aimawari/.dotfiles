local keymap = vim.keymap

--------------------------------------------------------------------------------
-- File explorer
keymap.set("n", "<leader>pv", vim.cmd.Ex)

--------------------------------------------------------------------------------
-- Visual mode movement (move lines or shift indentation)
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move selected line(s) down
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move selected line(s) up
keymap.set("v", "H", "<gv")              -- Shift left
keymap.set("v", "L", ">gv")              -- Shift right

--------------------------------------------------------------------------------
-- Normal mode line joining & centering scroll
keymap.set("n", "J", "mzJ`z")       -- Join lines, keep cursor position
keymap.set("n", "<C-d>", "<C-d>zz") -- Page down and center
keymap.set("n", "<C-u>", "<C-u>zz") -- Page up and center
keymap.set("n", "n", "nzzzv")       -- Search next and center
keymap.set("n", "N", "Nzzzv")       -- Search previous and center

--------------------------------------------------------------------------------
-- Yank & paste with system clipboard or without affecting registers
keymap.set("x", "<leader>p", [["_dP]])         -- Paste without overwriting default register
keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Yank to system clipboard
keymap.set("n", "<leader>Y", [["+Y]])          -- Yank line to system clipboard
keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- Delete without yanking

--------------------------------------------------------------------------------
-- LSP formatting
keymap.set("n", "<leader>f", vim.lsp.buf.format)
keymap.set("i", "<C-b>", "<C-x><C-o>")

--------------------------------------------------------------------------------
-- Quickfix and location list navigation
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")     -- Next quickfix item
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")     -- Previous quickfix item
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz") -- Next location list item
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz") -- Previous location list item

--------------------------------------------------------------------------------
-- Search and replace word under cursor
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--------------------------------------------------------------------------------
-- Make current file executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
