local default_opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>m', ':NvimTreeToggle<CR>', default_opts)
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", default_opts)
vim.api.nvim_set_keymap('n', '<Tab>', '<Plug>(cokeline-focus-next)<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<S-Tab>', '<Plug>(cokeline-focus-prev)<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<leader>x', ':bd<CR>', default_opts)

vim.api.nvim_set_keymap('i', '<Tab>', "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'", {expr = true, noremap = false})
vim.api.nvim_set_keymap('s', '<Tab>', "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'", {expr = true, noremap = false})
vim.api.nvim_set_keymap('i', '<S-Tab>', "vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", {expr = true, noremap = false})
vim.api.nvim_set_keymap('s', '<S-Tab>', "vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", {expr = true, noremap = false})

vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', default_opts)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', default_opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', default_opts)

vim.keymap.set({ 'i' }, '<C-k>',
    function()
        require('lsp_signature').toggle_float_win()
    end,
{ silent = true, noremap = true, desc = 'toggle signature' })


vim.keymap.set({ 'n' }, '<Leader>k', function()
vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.api.nvim_set_keymap('n', 'gh', ':ClangdSwitchSourceHeader<CR>', default_opts)
