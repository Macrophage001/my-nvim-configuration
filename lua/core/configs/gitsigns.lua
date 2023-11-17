local icons = require 'icons'

local opts = {
  signs = {
    add = { text = icons.git.FileAdded },
    change = { text = icons.git.FileChanged },
    delete = { text = icons.git.FileDeleted },
    topdelete = { text = icons.git.FileDeleted },
    changedelete = { text = icons.git.FileDeleted },
  },
}

return opts
