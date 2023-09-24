return {
	"catppuccin/nvim",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = {
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
				conditionals = { "bold", "italic" },
				loops = {},
				functions = { "bold", "italic" },
				keywords = { "bold", "italic" },
				strings = { "italic" },
				variables = {},
				numbers = {},
				booleans = {},
				properties = { "bold" },
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
		vim.cmd.colorscheme "catppuccin-mocha"
	end
}
