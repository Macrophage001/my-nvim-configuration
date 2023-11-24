return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  version = 'v3.*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = function()
    return require 'custom.configs.bufferline'
  end,
}
