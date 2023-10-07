return {
	"folke/trouble.nvim",
	event = "VeryLazy",
	requires = "nvim-tree/nvim-web-devicons",
	config = function()
		require("trouble").setup({})
	end
}
