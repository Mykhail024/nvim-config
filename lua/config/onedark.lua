vim.g.onedark_transparent_background = true

require('onedark').setup {
    style = 'warm',
    transparent = false,
    lualine = {
        transparent = false, -- lualine center bar transparency
    },
    term_colors = false,
    cmp_itemkind_reverse = false,
    colors = {
        bg0 = "#232326",
        bg1 = "#2c2d31",
        bg2 = "#35363b",
        bg3 = "#37383d",
    }
}
require('onedark').load()
