
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Key mapping for Nvim Tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true,desc = 'Nvim Tree Open' })


-- Key mapping for Windows split
vim.keymap.set('n', '<leader>wh', '<C-w>s', { noremap = true, silent = true, desc = 'Horizontal Split' })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { noremap = true, silent = true, desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>w=', '<C-w>=', { noremap = true, silent = true, desc = 'Equal Split' })
vim.keymap.set('n', '<leader>wd', '<cmd>close<CR>', { noremap = true, silent = true, desc = 'Delete Window' })


vim.keymap.set('n', '<leader>L', ':Lazy<CR>', {noremap = true, silent = true, desc = 'Lazy Plugin Window'})
