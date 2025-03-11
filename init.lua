require('options')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require('colorschemes.catppuccin'),

  { import = 'core.plugins' },
  { import = 'custom.plugins' },
})

require('core.lspconfig')

require('utils').load_mappings()
require('utils').load_autocmds()
