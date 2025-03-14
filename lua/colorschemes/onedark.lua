return {
	-- Theme inspired by Atom
	'navarasu/onedark.nvim',
	priority = 1000,
	config = function()
		require('onedark').setup {
			-- Main options --
			style = 'darker',    -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
			transparent = false, -- Show/hide background
			term_colors = true,  -- Change terminal color as per the selected theme style
			ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
			cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

			-- toggle theme style ---
			toggle_style_key = nil,                                                     -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
			toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

			-- Change code style ---
			-- Options are italic, bold, underline, none
			-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
			code_style = {
				comments = 'italic,bold',
				keywords = 'italic,bold',
				functions = 'italic,bold',
				strings = 'italic',
				variables = 'none'
			},

			-- Lualine options --
			lualine = {
				transparent = false, -- lualine center bar transparency
			},

			-- Custom Highlights --
			colors = {
				-- red = "#f95b6e",
				-- cyan = "#25ddea",
				-- blue = "#47b7ff",
				-- purple = "#fe7eff",
				-- yellow = "#fede5d",
				-- -- orange = "#ffe178",
				-- bright_orange = "#ff8800", -- define a new colorA
			},
			highlights = {},
			-- Plugins Config --
			diagnostics = {
				darker = true, -- darker colors for diagnostic
				undercurl = true, -- use undercurl instead of underline for diagnostics
				background = true, -- use background color for virtual text
			},
		}
		vim.cmd.colorscheme 'onedark'
	end,
}
