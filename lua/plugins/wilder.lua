return {
  {
    "gelguy/wilder.nvim",
    -- event = "CmdlineEnter",
    config = function()
      local wilder = require('wilder')
      wilder.setup({
        modes = { ':', '/', '?' },
      })

      -- Add more configurations here if needed
    end,
  },
}
