cfg = function()
require("lsp_signature").setup({
    floating_window = true,
    timer_interval = 100,
    floating_window_above_cur_line = true,
    hi_parameter = "Search",
    bind = true,
    extra_trigger_chars = { "(", ",", "{", "<"},
    handler_opts = {
        border = "single",
    },
})
end

require("lsp_signature").on_attach(cfg)
