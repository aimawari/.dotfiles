local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is installed, if not, clone it
if vim.fn.empty(vim.fn.glob(lazypath)) > 0 then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- Latest stable release
        lazypath,
    })
end

-- Prepend lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim with plugins
require("lazy").setup({
    { "LazyVim/LazyVim" },
    { import = "aimawari.plugins" },
    { import = "aimawari.plugins.lsp" },
}, {
    install = {
        colorscheme = { "nightfly" }, -- Set the colorscheme
    },
    checker = {
        enabled = true,  -- Enable automatic checking for updates
        notify = false,   -- Disable notifications for updates
    },
    change_detection = {
        notify = false,   -- Disable notifications for change detection
    },
})

