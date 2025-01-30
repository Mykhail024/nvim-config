require("config.lazy")

if vim.fn.argc() == 0 then
  if vim.fn.filereadable("CMakeLists.txt") then
    vim.cmd(":SessionManager load_current_dir_session")
  end
end

require("config.mappings")
require("config.options")

