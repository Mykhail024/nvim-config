autocmd("VimEnter", {
    group = augroup("autoupdate"),
        callback = function()
        require("lazy").update({ show = false })
        end,
})
