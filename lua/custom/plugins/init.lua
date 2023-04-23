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
		"goolord/alpha-nvim",
		config = function()
			require('alpha').setup(require('alpha.themes.dashboard').config)
		end
	},
	{
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end
	},
	{
		"mbbill/undotree"
	},
	{
		'akinsho/bufferline.nvim',
		version = "v3.*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require('bufferline').setup {
				options = {
					buffer_close_icon = '',
					modified_icon = '●',
					close_icon = '',
					left_trunc_marker = '',
					right_trunc_marker = '',
					color_icons = true,
					seperator_style = "thick",
				}
			}
		end,
	},
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = function()
			require("toggleterm").setup({
				-- direction = "float"
			})
		end
	},
	{
		'folke/todo-comments.nvim',
		event = 'BufRead',
		config = function()
			require("todo-comments").setup()
		end
	},
	{
		'tpope/vim-surround'
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_next = "<c-j>",
						jump_prev = "<c-k>",
						accept = "<c-a>",
						refresh = "r",
						open = "<M-CR>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = false,
					debounce = 75,
					keymap = {
						accept = "<c-a>",
						accept_word = false,
						accept_line = false,
						next = "<c-j>",
						prev = "<c-k>",
						dismiss = "<C-e>",
					},
				},
			})
		end
	},
	{
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup({
				suggestion = {
					auto_trigger = true
				}
			})
		end,
	}
}
