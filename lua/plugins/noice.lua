-- lazy.nvim
return{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    },
    config=function()

        require("noice").setup({
            messages = {
            -- NOTE: If you enable messages, then the cmdline is enabled automatically.
            -- This is a current Neovim limitation.
            enabled = true, -- enables the Noice messages UI
            view = "notify", -- disable notifications for normal messages
            view_error = false, -- disable notifications for errors
            view_warn = false, -- disable notifications for warnings
            view_history = "messages", -- still view message history
            view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
            },
        -- You can add more configuration options if needed
        })
    end
}
