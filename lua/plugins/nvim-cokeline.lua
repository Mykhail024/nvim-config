return {
    "willothy/nvim-cokeline",
    dependencies = {
        "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
        "nvim-tree/nvim-web-devicons", -- If you want devicons
    },
    config = function()
        require "config.nvim-cokeline"
    end
}
