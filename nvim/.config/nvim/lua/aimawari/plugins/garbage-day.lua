return {
    'zeioth/garbage-day.nvim',
    dependencies = 'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    opts = {
        excluded_lsp_clients = { 'copilot', 'dartls' },
        aggressive_mode = false,
        grace_period = 60 * 30,     -- 30 minutes
        wakeup_delay = 5000,
        notifications = true,
    },
}
