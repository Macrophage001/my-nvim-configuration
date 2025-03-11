return {
  'kevinhwang91/nvim-ufo',
  event = "VeryLazy",
  dependencies = {
    'kevinhwang91/promise-async',
  },
  config = function()
    require('ufo').setup {
      open_fold_hl_timeout = 150,
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end
    }
  end
}
