return {
  'lukas-reineke/indent-blankline.nvim',
  -- Can't use this here for the moment, because it is trying to use the deprecated version of indentblanklines
  -- opts = function()
  --   return require 'core.configs.indentblanklines'
  -- end,

  config = function()
    require('ibl').setup {
      debounce = 100,
      indent = { char = '|' },
      whitespace = { highlight = { 'Whitespace', 'NonText' } },
      -- scope = { exclude = { language = { "lua" } } },
      scope = { enabled = false },
    }
  end,
}
