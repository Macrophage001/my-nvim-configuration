local icons = require 'icons'

local diagnostics_indicator = function(num, _, diagnostics, _)
  local result = {}
  local symbols = {
    error = icons.diagnostics.Error,
    warning = icons.diagnostics.Warning,
    info = icons.diagnostics.Information,
  }
  for name, count in pairs(diagnostics) do
    if symbols[name] and count > 0 then
      table.insert(result, symbols[name] .. ' ' .. count)
    end
  end
  local str_result = table.concat(result, ' ')
  return #str_result > 0 and str_result or ''
end

return {
  highlights = {
    separator = {
      fg = '#191a25',
      bg = '#191a25',
    },
    buffer_selected = {
      bold = true,
    },
    fill = {
      bg = '#191a25',
    },
  },

  options = {
    close_command = 'Bdelete! %d',       -- can be a string | function, see "Mouse actions",
    right_mouse_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
    left_mouse_command = 'buffer %d',    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    indicator = {
      icon = icons.ui.BoldLineLeft,
      style = 'icon',
    },
    buffer_close_icon = icons.ui.BoldClose,
    modified_icon = icons.ui.Modified,
    close_icon = icons.ui.BoldClose,
    left_trunc_marker = icons.ui.ArrowCircleLeft,
    right_trunc_marker = icons.ui.ArrowCircleRight,
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    truncate_names = true,  -- whether or not tab names should be truncated
    tab_size = 21,
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = false,
    diagnostics_indicator = diagnostics_indicator,
    offsets = {
      {
        filetype = 'neo-tree',
        text = 'File Explorer',
        highlight = 'Directory',
        padding = 1,
      },
      {
        filetype = 'undotree',
        text = 'Undotree',
        highlight = 'PanelHeading',
        padding = 1,
      },
      {
        filetype = 'DiffviewFiles',
        text = 'Diff View',
        highlight = 'PanelHeading',
        padding = 1,
      },
      {
        filetype = 'lazy',
        text = 'Lazy',
        highlight = 'PanelHeading',
        padding = 1,
      },
    },
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    enforce_regular_tabs = true,
    always_show_bufferline = false,
    separator_style = 'thin',
    hover = {
      enabled = true, -- requires nvim 0.8+
      delay = 200,
      reveal = { 'close' },
    },
    sort_by = 'id',
  },
}
