return { 
	'AlphaTechnolog/pywal.nvim', 
	as = 'pywal',
	config = function()
		local pywal = require('pywal')
		pywal.setup()
		--local pywal16_core = require('pywal16.core')
		--pywal16_core.get_colors()
	end,
}
