local icons = require 'icons'

return {
  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = function()
    return require 'core.configs.gitsigns'
  end,
}
