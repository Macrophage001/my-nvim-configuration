return {
  'Wansmer/treesj',
  event = 'BufReadPre',
  keys = { '<space>m', '<space>j', '<space>s' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup()
  end,
}
