
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Key mapping for Nvim Tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true,desc = 'Nvim Tree Open' })



vim.keymap.set('n', '<leader>wh', ':split<CR>', { noremap = true, silent = true, desc = 'Horizontal Split' })
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { noremap = true, silent = true, desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>wd', ':q<CR>', { noremap = true, silent = true, desc = 'Delete Window' })
