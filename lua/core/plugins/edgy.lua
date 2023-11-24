return {
  'folke/edgy.nvim',
  event = 'VeryLazy',
  opts = function()
    return require 'core.configs.edgy'
  end,
}
