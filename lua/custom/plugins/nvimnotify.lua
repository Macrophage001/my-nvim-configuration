return {
  'rcarriga/nvim-notify',
  keys = {
    {
      '<leader>un',
      function()
        require('notify').dismiss { silent = true, pending = true }
      end,
      desc = 'Dismiss all notifications',
    },
  },
  opts = function()
    return require 'custom.configs.nvimnotify'
  end,
}
