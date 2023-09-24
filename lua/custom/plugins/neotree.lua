return {
	'nvim-neo-tree/neo-tree.nvim',
	config = function()
		local icons = require('icons').git

		require('neo-tree').setup({
			close_if_last_window = true,
			enable_git_status = true,
			enable_diagnostics = true,

			git_status = {
				untracked = icons.FileUntracked,
				changed = '',
				deleted = icons.FileDeleted,
				ignored = icons.FileIgnored,
				renamed = icons.FileRenamed,
				staged = icons.FileStaged,
			},
		})
	end,

	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-tree/nvim-web-devicons' },
		{ 'MunifTanjim/nui.nvim' },
	},
}
