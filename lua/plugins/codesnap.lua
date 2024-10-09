return {
	"mistricky/codesnap.nvim",
	build = "make",
	config = function()
		require("codesnap").setup({
			watermark = "",
			save_path = "~/Pictures",
			bg_theme = "dusk",
		})
	end,
}
