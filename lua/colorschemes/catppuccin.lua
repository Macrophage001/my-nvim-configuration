return {
  'catppuccin/nvim',
  config = function()
    local opts = require 'colorschemes.configs.catppuccin'
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme 'catppuccin'
  end,
}
