return {
  'nvimtools/none-ls.nvim',               -- configure formatters & linters
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to enable uncomment this
  dependencies = { 'jay-babu/mason-null-ls.nvim' },
  opts = function()
    return require 'core.configs.nonels'
  end,
}
