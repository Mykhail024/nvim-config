require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "clangd", "cssls", "glsl_analyzer", "html", "cmake", "bashls", "jsonls", "phpactor", "sqlls", "lua_ls", "pyright", "emmet_ls", "tailwindcss", "jsonls"}
}

require("mason-lspconfig").setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {}
    end
}


local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

require'lspconfig'.clangd.setup{
    cmd = {"/usr/bin/clangd", "-j=8", "--malloc-trim", "--background-index=true", "--pch-storage=memory", "-log=error", "--limit-results=500", "-clang-tidy", "--experimental-modules-support"}
}

if not configs.qmlls then
    configs.qmlls = {
        default_config = {
            cmd = { 'qmlls6' },
            --root_dir = lspconfig.util.root_pattern('CMakeLists.txt') or lspconfig.util.root_pattern('.git'),
            root_dir = ".",
            filetypes = { 'qml' },
        },
    }
end
lspconfig.qmlls.setup {}

local mason_tool_installer = require("mason-tool-installer")

mason_tool_installer.setup({
    ensure_installed = {
        "prettier", -- prettier formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- js linter
    },
})
