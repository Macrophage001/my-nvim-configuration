return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  cmd = 'Neotree',
  keys = {
    {
      '<Tab>',
      function()
        require('neo-tree.command').execute { toggle = true, dir = vim.loop.cwd() }
      end,
    },
    {
      '<leader>ge',
      function()
        require('neo-tree.command').execute { source = 'git_status', toggle = true }
      end,
    },
    {
      '<leader>be',
      function()
        require('neo-tree.command').execute { source = 'buffers', toggle = true }
      end,
    },
  },
  config = function()
    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

    require('neo-tree').setup {
      sources = {
        'filesystem',
        'buffers',
        'git_status',
        'document_symbols',
      },
      open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },

      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,

      git_status = {
        untracked = require('icons').git.FileUntracked,
        changed = '',
        deleted = require('icons').git.FileDeleted,
        ignored = require('icons').git.FileIgnored,
        renamed = require('icons').git.FileRenamed,
        staged = require('icons').git.FileStaged,
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = require('icons').ui.BoldArrowRight,
          expander_expanded = require('icons').ui.BoldArrowDown,
          expander_highlight = 'Directory',
        },
      },
    }
  end,

  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'MunifTanjim/nui.nvim' },
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      config = function()
        require('window-picker').setup {
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
              -- if the buffer type is one of following, the window will be ignored
              buftype = { 'terminal', 'quickfix' },
            },
          },
        }
      end,
    },
  },
}
