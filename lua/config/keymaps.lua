local global = vim.g
local key = vim.keymap

global.mapleader = " "

-- Key mapping for Nvim Tree
key.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true,desc = 'Nvim Tree Open' })


-- Key mapping for Windows split
key.set('n', '<leader>wh', '<C-w>s', { noremap = true, silent = true, desc = 'Horizontal Split' })
key.set('n', '<leader>wv', '<C-w>v', { noremap = true, silent = true, desc = 'Vertical Split' })
key.set('n', '<leader>w=', '<C-w>=', { noremap = true, silent = true, desc = 'Equal Split' })
key.set('n', '<leader>wd', '<cmd>close<CR>', { noremap = true, silent = true, desc = 'Delete Window' })


key.set('n', '<leader>Lp', ':Lazy<CR>', {noremap = true, silent = true, desc = 'Lazy Plugin Window'})


-- Key mapping for leetcode 
key.set('n', '<leader>lm', ':Leet menu<CR>',{desc = 'Leet menu'})
key.set('n', '<leader>lc', ':Leet console<CR>',{desc = 'Leet console'})
key.set('n', '<leader>li', ':Leet info<CR>',{desc = 'Leet info'})
key.set('n', '<leader>ll', ':Leet lang<CR>',{desc = 'Leet language'})
key.set('n', '<leader>lr', ':Leet run<CR>',{desc = 'Leet run'})
key.set('n', '<leader>lt', ':Leet test<CR>',{desc = 'Leet test'})
key.set('n', '<leader>ls', ':Leet submit<CR>',{desc = 'Leet submit'})


-- Key mapping for cut paste
key.set('v', '<C-c>', '"+y', {desc = 'Copy text'})
key.set('v', '<C-v>', '"*p', {desc = 'past from clipboard'})
