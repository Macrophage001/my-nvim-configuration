-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		'nvim-neo-tree/neo-tree.nvim',
		config = function()
			require('neo-tree').setup({
				close_if_last_window = true,
			})
		end,
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-tree/nvim-web-devicons' },
			{ 'MunifTanjim/nui.nvim' },
		},
	},
	{
		'glepnir/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup({
				theme = 'hyper',
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{ desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
						{
							icon = ' ',
							icon_hl = '@variable',
							desc = 'Files',
							group = 'Label',
							action = 'Telescope find_files',
							key = 'f',
						},
						{
							icon_hl = '@variable',
							desc = 'Recent Files',
							group = 'Label',
							action = 'Telescope oldfiles',
							key = 'r',
						},
					},
				},
			})
		end,
		dependencies = { { 'nvim-tree/nvim-web-devicons' } }
	},
	{
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end
	},
}
