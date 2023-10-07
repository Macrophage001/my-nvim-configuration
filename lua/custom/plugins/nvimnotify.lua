return {
	'rcarriga/nvim-notify',
	lazy = true,
	event = { "BufReadPre" },
	config = function()
		require("notify").setup({
			background_colour = "#282c34",
			fps = 60,
			top_down = false,
			render = "compact",
		})
	end
}
