return {
    "akinsho/toggleterm.nvim",
    version = "*", config = true,
    config = function()
        require'toggleterm'.setup ({
            shade_terminals = false
        })
    end
}
