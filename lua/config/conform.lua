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

local function glob_to_regex(pattern)
  pattern = string.gsub(pattern, "%*", ".*")
  return pattern
end

local function is_file_ignored(bufnr)
  local file_path = vim.api.nvim_buf_get_name(bufnr)
  local ignore_file = vim.fn.stdpath("config") .. "/clang-format-ignore"

  if vim.fn.filereadable(ignore_file) == 1 then
    local ignored_files = vim.fn.readfile(ignore_file)
    for _, pattern in ipairs(ignored_files) do
      local regex_pattern = glob_to_regex(pattern)
      if string.match(file_path, regex_pattern) then
        return true
      end
    end
  end

  return false
end

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      if not is_file_ignored(args.buf) then
        require("conform").format({ bufnr = args.buf })
      end
    end,
})

require("conform").formatters.clang_format = {
  prepend_args = { '--style=file:' .. vim.fn.stdpath("config") .. '/clang-format' }
}
