return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  lazy = true,
  event = "InsertEnter",
  opts = {
    history = true,
    updateevents = "TextChanged,TextChangedI",
  },
  dependencies = {
    { 'rafamadriz/friendly-snippets' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lsp' },
  },
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()
  end
}
