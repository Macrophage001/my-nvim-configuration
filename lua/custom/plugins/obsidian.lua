return {
	"epwalsh/obsidian.nvim",
	lazy = true,
	event = {
		"BufReadPre G:/My Drive/DriveSyncFiles/Obsidian Vaults/CheatSheets/**.md",
		"BufNewFile G:/My Drive/DriveSyncFiles/Obsidian Vaults/CheatSheets/**.md",
	},
	-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
	-- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		dir = "G:/My Drive/DriveSyncFiles/Obsidian Vaults/CheatSheets", -- no need to call 'vim.fn.expand' here
		-- see below for full list of options 👇
	},
	config = function(_, opts)
		require("obsidian").setup(opts)

		-- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
		-- see also: 'follow_url_func' config option below.
		vim.keymap.set("n", "gf", function()
			if require("obsidian").util.cursor_on_markdown_link() then
				return "<cmd>ObsidianFollowLink<CR>"
			else
				return "gf"
			end
		end, { noremap = false, expr = true })
	end,
}