return {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
        require "config.lsp_signature"
    end
}
