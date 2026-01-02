vim.api.nvim_set_hl(0,"MyLine", {bg="#2bd9fb"})

vim.keymap.set("n","<leader>hl", function()
    vim.api.nvim_buf_add_highlight(
        0,
    -1,
    "MyLine",
    vim.fn.line(".") -1,
            0,
            -1
    )
end
)
