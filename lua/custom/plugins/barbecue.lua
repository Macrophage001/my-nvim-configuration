return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  event = 'BufReadPre',
  config = function()
    require('barbecue').setup {
      theme = 'tokyonight',
      symbols = {
        modified = '',
        ellipsis = '…',
        separator = '',
      },
      kinds = {
        Text = '',
        Method = 'm',
        Function = '',
        Constructor = '',
        Field = '',
        Variable = '',
        Class = '',
        Interface = '',
        Module = '',
        Property = '',
        Unit = '',
        Value = '',
        Enum = '',
        Keyword = '',
        Snippet = '',
        Color = '',
        File = '',
        Reference = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = '',
        Event = '',
        Operator = '',
        TypeParameter = '',
        Object = '',
      },
    }
  end,
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons', -- optional dependency
  },
}
