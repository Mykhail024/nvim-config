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

vim.api.nvim_set_keymap('n', '<leader>t', ':ToggleTerm<CR>', { silent = true, noremap = true, desc = 'Toggle terminal' })


local function toggle_inlay_hints(buf, mode)
    local group = vim.api.nvim_create_augroup("inlay_hints", { clear = true })

    if mode == "always" then
        vim.lsp.inlay_hint.enable(true)
        vim.api.nvim_clear_autocmds({ group = group, buffer = buf })
        vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, { group = group, buffer = buf, callback = function() vim.lsp.inlay_hint.enable(true) end })
    elseif mode == "never" then
        vim.lsp.inlay_hint.enable(false)
        vim.api.nvim_clear_autocmds({ group = group, buffer = buf })
    elseif mode == "default" then
        vim.lsp.inlay_hint.enable(true)
        vim.api.nvim_clear_autocmds({ group = group, buffer = buf })
        vim.api.nvim_create_autocmd("InsertEnter", { group = group, buffer = buf, callback = function() vim.lsp.inlay_hint.enable(false) end })
        vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, { group = group, buffer = buf, callback = function() vim.lsp.inlay_hint.enable(true) end })
    end
    vim.g.GInlay_hints = mode or "default"
end

vim.keymap.set("n", "<leader>li", function()
    toggle_inlay_hints(buf, "default")
end, { buffer = buf, desc = "[l]sp [i]nlay [h]ints toggle (insert mode)" })

vim.keymap.set("n", "<leader>lh", function()
    toggle_inlay_hints(buf, "never")
end, { buffer = buf, desc = "[l]sp [h]ints toggle (never)" })

vim.keymap.set("n", "<leader>la", function()
    toggle_inlay_hints(buf, "always")
end, { buffer = buf, desc = "[l]sp [a]lways show inlay [h]ints" })

toggle_inlay_hints(buf, vim.g.GInlay_hints)
