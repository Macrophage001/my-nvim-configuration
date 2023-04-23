return {
	'sainnhe/everforest',
	config = function()
		vim.g.everforest_background = "soft"
		vim.g.everforest_better_performance = 1
		vim.g.everforest_enable_italic = 1

		vim.cmd.colorscheme 'everforest'
	end
}
