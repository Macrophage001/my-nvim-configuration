return {
	onedark = {
		-- Theme inspired by Atom
		'navarasu/onedark.nvim',
		priority = 1000,
		config = function()
			require('onedark').setup {
				-- Main options --
				style = 'dark',           -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
				transparent = false,      -- Show/hide background
				term_colors = true,       -- Change terminal color as per the selected theme style
				ending_tildes = false,    -- Show the end-of-buffer tildes. By default they are hidden
				cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

				-- toggle theme style ---
				toggle_style_key = nil,                                                          -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
				toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

				-- Change code style ---
				-- Options are italic, bold, underline, none
				-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
				code_style = {
					comments = 'italic,bold',
					keywords = 'none',
					functions = 'bold',
					strings = 'italic',
					variables = 'none'
				},

				-- Lualine options --
				lualine = {
					transparent = false, -- lualine center bar transparency
				},

				-- Custom Highlights --
				colors = {}, -- Override default colors
				highlights = {}, -- Override highlight groups

				-- Plugins Config --
				diagnostics = {
					darker = true, -- darker colors for diagnostic
					undercurl = true, -- use undercurl instead of underline for diagnostics
					background = true, -- use background color for virtual text
				},
			}
			vim.cmd.colorscheme 'onedark'
		end,
	},
	vscode = {
		'Mofiqul/vscode.nvim',
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'vscode'
		end,
	},
	catpuccin = {
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = {
					-- :h background
					light = "latte",
					dark = "frappe",
				},
				transparent_background = false,
				show_end_of_buffer = false, -- show the '~' characters after the end of buffers
				term_colors = false,
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					loops = {},
					functions = { "bold" },
					keywords = {},
					strings = { "italic" },
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = { "bold" },
					operators = {},
				},
				color_overrides = {},
				custom_highlights = {},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					telescope = true,
					notify = false,
					mini = false,
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})

			-- setup must be called before loading
			vim.cmd.colorscheme "catppuccin-frappe"
		end
	},
	kanagawa = {
		'rebelot/kanagawa.nvim',
		config = function()
			-- Default options:
			require('kanagawa').setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = { bold = true },
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = {
					-- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function() -- add/modify highlights
					return {}
				end,
				theme = "wave", -- Load "wave" theme when 'background' option is not set
				background = {
					-- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus"
				},
			})

			-- setup must be called before loading
			vim.cmd.colorscheme 'kanagawa'
		end
	},
	gruvbox = {
		'ellisonleao/gruvbox.nvim',
		config = function()
			vim.cmd.colorscheme 'gruvbox'
		end
	},
}
