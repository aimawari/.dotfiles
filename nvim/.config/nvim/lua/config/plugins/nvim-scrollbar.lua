return {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    config = function()
        require("scrollbar").setup {
            handle = {
                color = "#51504f",
            },
            marks = {
                search = { color = "#f6ad55" },
                error = { color = "#f56565" },
                warn = { color = "#ed8936" },
                info = { color = "#4fd1c5" },
                hint = { color = "#68d391" },
                misc = { color = "#805ad5" },
            }
        }
    end
}
