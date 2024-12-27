require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "clangd", "cssls", "glsl_analyzer", "html", "cmake", "bashls", "jsonls", "phpactor", "sqlls", "lua_ls"}
}

local function toggle_inlay_hints(buf, mode)
    local clangd_ext = require("clangd_extensions.inlay_hints")
    local group = vim.api.nvim_create_augroup("clangd_no_inlay_hints_in_insert", { clear = true })

    if mode == "always" then
        clangd_ext.set_inlay_hints()
        vim.api.nvim_clear_autocmds({ group = group, buffer = buf })

        vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, { group = group, buffer = buf, callback = clangd_ext.set_inlay_hints })

    elseif mode == "never" then
        clangd_ext.disable_inlay_hints()
        vim.api.nvim_clear_autocmds({ group = group, buffer = buf })

    elseif mode == "default" then
        clangd_ext.set_inlay_hints()
        vim.api.nvim_clear_autocmds({ group = group, buffer = buf })

        vim.api.nvim_create_autocmd("InsertEnter", { group = group, buffer = buf, callback = clangd_ext.disable_inlay_hints })
        vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, { group = group, buffer = buf, callback = clangd_ext.set_inlay_hints })
    end

    vim.g.Clangd_inlay_mode = mode or "default"
end

function on_mason_lspconfig_attach(client, buf)
    local clangd_ext = require("clangd_extensions.inlay_hints")

    vim.keymap.set("n", "<leader>li", function()
        toggle_inlay_hints(buf, "default")
    end, { buffer = buf, desc = "[l]sp [i]nlay [h]ints toggle (insert mode)" })

    vim.keymap.set("n", "<leader>lh", function()
        toggle_inlay_hints(buf, "never")
    end, { buffer = buf, desc = "[l]sp [h]ints toggle (never)" })

    vim.keymap.set("n", "<leader>la", function()
        toggle_inlay_hints(buf, "always")
    end, { buffer = buf, desc = "[l]sp [a]lways show inlay [h]ints" })

    toggle_inlay_hints(buf, vim.g.Clangd_inlay_mode)
end

require("mason-lspconfig").setup_handlers {
    function(server_name)
        if server_name == "clangd" then
            require("lspconfig")[server_name].setup {
                on_attach = on_mason_lspconfig_attach
            }
        else
            require("lspconfig")[server_name].setup {}
        end
    end
}


local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

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
