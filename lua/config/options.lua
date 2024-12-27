vim.cmd([[
    set number
    set autoindent
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set smarttab
    set noswapfile
    set noshowmode
    set mouse=a
    set foldmethod=syntax
    set nofoldenable
    set encoding=UTF-8
    set scrolloff=12
    set clipboard=unnamedplus

    filetype plugin on
    syntax on
]])

vim.o.guifont = "Source Code Pro:h10.5"
vim.g.neovide_scale_factor = 1.0

vim.opt.ssop:append({ 'globals', 'tabpages' })

-- Helper function for transparency formatting
local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end

-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.90
vim.g.transparency = 0
vim.g.neovide_background_color = "#0f1117" .. alpha()
vim.g.neovide_window_blurred = true
vim.g.neovide_floating_blur_amount_x = 4.0
vim.g.neovide_floating_blur_amount_y = 4.0
vim.g.neovide_theme = 'auto'
vim.g.neovide_refresh_rate_idle = 10
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_cursor_antialiasing = true
--vim.g.neovide_cursor_trail_size = 0.8
--vim.g.neovide_profiler = true
--vim.g.neovide_fullscreen = true
--vim.g.neovide_scroll_animation_length = 0.1
