return {
	{
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
		},
		-- Optional, for file icons
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 30,
					side = "left",
				},
				filters = {
					dotfiles = false, -- Hide dotfiles
				},
				git = {
					enable = true,
					ignore = false,
				},
			})
		end,
	},
}
