return {
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
