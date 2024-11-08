return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        require("notify").setup {
            stages = "fade_in_slide_out",
            background_colour = "floatshadow",
            timeout = 3000,
        }
        vim.notify = require("notify")
    end
}
