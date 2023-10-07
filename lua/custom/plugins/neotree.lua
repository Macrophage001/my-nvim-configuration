return {
	'nvim-neo-tree/neo-tree.nvim',
	lazy = true,
	config = function()
		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

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
		{
			's1n7ax/nvim-window-picker',
			version = '2.*',
			config = function()
				require 'window-picker'.setup({
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { 'neo-tree', "neo-tree-popup", "notify" },
							-- if the buffer type is one of following, the window will be ignored
							buftype = { 'terminal', "quickfix" },
						},
					},
				})
			end,
		}
	},
}
