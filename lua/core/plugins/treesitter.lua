local M = {
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    -- config = function()
    --   pcall(require('nvim-treesitter.install').update { with_sync = true })
    -- end,
  },
  {
    'nvim-treesitter/playground',
    lazy = true,
  },
}

return M
