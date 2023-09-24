return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
				auto_refresh = true,
				keymap = {
					jump_next = "<c-j>",
					jump_prev = "<c-k>",
					accept = "<Tab>",
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
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<Tab>",
					accept_word = false,
					accept_line = false,
					next = "<C-j>",
					prev = "<C-k>",
					dismiss = "<C-e>",
				},
			},
		})
	end
}