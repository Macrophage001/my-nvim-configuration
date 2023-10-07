return {
  'nvim-telescope/telescope.nvim',
  lazy = true,
  cmd = 'Telescope',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
          },
        },
      },
    })
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
  end,
}
