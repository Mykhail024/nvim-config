return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        auto_reload_on_write = true,
        update_focused_file = {
            enable      = true
        },
        diagnostics = {
            enable = false,
        },
        actions = {
            open_file = {
                quit_on_open = true,
            }
        }
    }
}

