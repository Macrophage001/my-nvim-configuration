return {
	'haishanh/night-owl.vim',
	config = function()
		require('night-owl').setup()
		vim.cmd.colorscheme 'night-owl'
	end
}

