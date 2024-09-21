
return {
  'akinsho/toggleterm.nvim', 
  version = "*", 
  config = function()
    require('toggleterm').setup({
      open_mapping = [[<c-\>]], -- Optional: use Ctrl+\ to toggle terminal
      direction = 'float',      -- Floating terminal
      float_opts = {
        border = 'curved',      -- You can change border style ('single', 'double', 'shadow', 'curved')
        width = 80,             -- Set the width of the floating window
        height = 20,            -- Set the height of the floating window
        winblend = 10,          -- Optional transparency
      }
    })

    -- Map <leader>t to toggle the floating terminal
    vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', { 
      noremap = true, 
      silent = true, 
      desc = 'Toggle Floating Terminal' 
    })
  end
}

