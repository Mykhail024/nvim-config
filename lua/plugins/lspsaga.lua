return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
            diagnostic = {
                keys = {
                    quit = {'q', '<ESC>'}
                },
                show_code_action = true,
                show_source = true,
                jump_num_shortcut = true,
                scroll_preview = true,
                --virtual_text = true, -- це важливо
                --diagnostic_only_current = true,
                --show_line_diagnostics = true
            },
            ui = {
                diagnostic = {
                    virtual_text = true,
                    virtual_text_prefix = '●',
                }
            }
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
}
