return {
	"JoosepAlviste/palenightfall.nvim",
	config = function()
		require("palenightfall").setup({
			transparent = true,
		})
		vim.cmd.colorscheme("palenightfall")
	end
}
