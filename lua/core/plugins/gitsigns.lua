local icons = require('icons')

return {
  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = icons.git.FileAdded },
      change = { text = icons.git.FileChanged },
      delete = { text = icons.git.FileDeleted },
      topdelete = { text = icons.git.FileDeleted },
      changedelete = { text = icons.git.FileDeleted },
    },
  },
}
