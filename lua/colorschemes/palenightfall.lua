return {
	"JoosepAlviste/palenightfall.nvim",
	config = function()
		require("palenightfall").setup()
		vim.cmd.colorscheme "palenightfall"
	end
}
