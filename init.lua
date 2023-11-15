require 'options'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require('colorschemes.catpuccin'),

  { import = 'core.plugins' },
  { import = 'custom.plugins' },
})

require("core.lspconfig")

local load_mappings = require('utils').load_mappings
local load_autocmds = require('utils').load_autocmds

load_autocmds(require('core.autocmds'))
load_mappings(require('core.keymaps'))
