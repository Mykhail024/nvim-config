  -- Set up nvim-cmp.
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require ('cmp')

  cmp.setup({
      snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
  end,
      },
      sorting = {
          comparators = {
              cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            require("clangd_extensions.cmp_scores"),
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
      },
      window = {
          -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                                          ['<C-f>'] = cmp.mapping.scroll_docs(4),
                                          ['<C-Space>'] = cmp.mapping.complete(),
                                          ['<C-e>'] = cmp.mapping.abort(),
                                          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
      }, {
          { name = "buffer" },
          { name = "nvim_lua" },
          { name = "path" },
      })
  })

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
  { name = 'git' },
}, {
{ name = 'buffer' },
})
})
require("cmp_git").setup()

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
                  sources = {
                      { name = 'buffer' }
                  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
                  sources = cmp.config.sources({
                      { name = 'path' }
                  }, {
                      { name = 'cmdline' }
                  }),
                  matching = { disallow_symbol_nonprefix_matching = false }
})

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
