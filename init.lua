require("config.options")
require("config.lazy")
require("config.mappings")


if vim.fn.argc() == 0 then
  if vim.fn.filereadable("CMakeLists.txt") then
    vim.cmd(":SessionManager load_current_dir_session")
  end
end
