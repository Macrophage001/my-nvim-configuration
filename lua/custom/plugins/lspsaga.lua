return {
	'nvimdev/lspsaga.nvim',
	lazy = true,
	event = 'BufReadPre',
	config = function()
		require('lspsaga').setup({
			ui = {
				code_action = '',
			}
		})
	end,
	dependencies = {
		'nvim-treesitter/nvim-treesitter', -- optional
		'nvim-tree/nvim-web-devicons', -- optional
	}
}
