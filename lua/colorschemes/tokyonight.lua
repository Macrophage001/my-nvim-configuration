return {
	'folke/tokyonight.nvim',
	config = function()
		require("tokyonight").setup({
			transparent = true,
			lualine_bold = true,
		})

		vim.cmd.colorscheme 'tokyonight-moon'
	end
}
