vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<Enter>")

vim.keymap.set("n", "H", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "L", ":bnext<CR>", { silent = true })

vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { silent = true })
