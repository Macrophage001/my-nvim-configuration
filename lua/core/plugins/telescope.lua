local icons = require 'icons'
return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
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

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-s>'] = actions.toggle_selection,
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
        prompt_prefix = '❯ ',
        selection_caret = icons.ui.Circle .. ' ',
        sorting_strategy = 'ascending',
        layout_config = {
          prompt_position = 'top',
        },
        path_display = { 'smart' },
        results_title = '',
      },
    }
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'aerial')
  end,
}
