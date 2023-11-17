return {
  flavour = 'mocha', -- latte, frappe, macchiato, mocha
  background = {
    light = 'latte',
    dark = 'frappe',
  },
  transparent_background = false,
  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = 'dark',
    percentage = 0.15,
  },
  no_italic = false, -- Force no italic
  no_bold = false,   -- Force no bold
  styles = {
    -- comments = {  },
    conditionals = {},
    loops = {},
    functions = {},
    keywords = {},
    strings = { 'italic' },
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  integrations = {
    alpha = true,
    flash = true,
    aerial = true,
    bufferline = true,
    cmp = true,
    gitsigns = true,
    neotree = true,
    notify = true,
    treesitter = true,
    treesitter_context = true,
    telescope = {
      enabled = true,
      style = 'nvchad',
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    noice = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
      inlay_hints = {
        background = true,
      },
    },
  },
}
