vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<Enter>", { desc = "Toggle NvimTree" })

vim.keymap.set("n", "H", ":bprevious<CR>", { desc = "previous buffer", silent = true })
vim.keymap.set("n", "L", ":bnext<CR>", { desc = "next buffer", silent = true })

vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "delete current buffer", silent = true })

vim.keymap.set("n", "gv", function()
	vim.lsp.buf.definition()
end, { buffer = bufnr })
