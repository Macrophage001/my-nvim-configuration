return {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('ibl').setup({
      debounce = 100,
      indent = { char = "|" },
      whitespace = { highlight = { "Whitespace", "NonText" } },
      -- scope = { exclude = { language = { "lua" } } },
      scope = { enabled = false },
    })
  end,
}
