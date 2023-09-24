return {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false,
    priority = 1000,
	config = function()
		vim.opt.background = "light" -- default to dark or light style
		vim.cmd([[colorscheme monokai-nightasty]])
	end
}
