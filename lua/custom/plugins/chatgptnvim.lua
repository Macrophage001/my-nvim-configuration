return {
	"dreamsofcode-io/chatgpt.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("chatgpt").setup({
			-- Will have to change this in the future.
			api_key_cmd = "echo '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'"
		})
	end,
}
