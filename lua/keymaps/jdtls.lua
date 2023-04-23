local jdtls = require 'jdtls'

vim.keymap.set('n', '<A-o>', jdtls.organize_imports, { desc = "JDTLS Organize Imports" })
