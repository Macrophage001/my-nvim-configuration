local opts = {
  debounce = 100,
  indent = { char = '|' },
  whitespace = { highlight = { 'Whitespace', 'NonText' } },
  -- scope = { exclude = { language = { "lua" } } },
  scope = { enabled = false },
}

return opts
