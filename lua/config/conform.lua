require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang_format" },
    cpp = { "clang_format" }
  },
  opts = {
    notify_on_error = true
  }
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      require("conform").format({ bufnr = args.buf })
    end,
})

require("conform").formatters.clang_format = {
  prepend_args = { '--style=file:' .. vim.fn.stdpath("config") .. '/clang-format' }
}
