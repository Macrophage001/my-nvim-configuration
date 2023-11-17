return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'j-hui/fidget.nvim', tag = 'legacy' },

    -- Additional lua configuration, makes nvim stuff amazing!
    { 'folke/neodev.nvim' },
    { 'antosha417/nvim-lsp-file-operations', config = true },
  },
  init = function()
    require('utils').lazy_load 'nvim-lspconfig'
  end,
}
