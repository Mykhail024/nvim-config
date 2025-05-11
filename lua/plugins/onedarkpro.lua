return {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
        require("onedarkpro").setup({
            colors = {
                onedark = {
                    bg = "#232326",
                    fg = "#b1b4b9",
                    red = "#e16d77",
                    orange = "#c99a6e",
                    yellow = "#dfbe81",
                    green = "#99bc80",
                    cyan = "#5fafb9",
                    blue = "#68aee8",
                    purple = "#c27fd7",
                    white = "#b1b4b9",
                    black = "#191a1c",
                    gray = "#646568",
                    highlight = "#e6cfa1",
                    comment = "#8b8d91",
                    none = "NONE",

                }
            }
        })
    end
}
