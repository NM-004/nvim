return {
	{
		"gelguy/wilder.nvim",
		-- event = "CmdlineEnter",
		config = function()
			local wilder = require("wilder")
			wilder.setup({
				modes = { ":", "/", "?" },
			})

			-- add more configurations here if needed
			wilder.set_option(
				"renderer",
				wilder.wildmenu_renderer({
					-- highlighter applies highlighting to the candidates
					highlighter = wilder.basic_highlighter(),
				})
			)
		end,
	},
}
