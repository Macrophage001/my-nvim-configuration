local function buf_kill(kill_command, bufnr, force)
  kill_command = kill_command or 'bd'

  local bo = vim.bo
  local api = vim.api
  local fmt = string.format
  local fn = vim.fn

  if bufnr == 0 or bufnr == nil then
    bufnr = api.nvim_get_current_buf()
  end

  local bufname = api.nvim_buf_get_name(bufnr)

  if not force then
    local choice
    if bo[bufnr].modified then
      choice = fn.confirm(fmt([[Save changes to "%s"?]], bufname), '&Yes\n&No\n&Cancel')
      if choice == 1 then
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd 'w'
        end)
      elseif choice == 2 then
        force = true
      else
        return
      end
    elseif api.nvim_buf_get_option(bufnr, 'buftype') == 'terminal' then
      choice = fn.confirm(fmt([[Close "%s"?]], bufname), '&Yes\n&No\n&Cancel')
      if choice == 1 then
        force = true
      else
        return
      end
    end
  end

  -- Get list of windows IDs with the buffer to close
  local windows = vim.tbl_filter(function(win)
    return api.nvim_win_get_buf(win) == bufnr
  end, api.nvim_list_wins())

  if force then
    kill_command = kill_command .. '!'
  end

  -- Get list of active buffers
  local buffers = vim.tbl_filter(function(buf)
    return api.nvim_buf_is_valid(buf) and bo[buf].buflisted
  end, api.nvim_list_bufs())

  -- If there is only one buffer (which has to be the current one), vim will
  -- create a new buffer on :bd.
  -- For more than one buffer, pick the previous buffer (wrapping around if necessary)
  if #buffers > 1 and #windows > 0 then
    for i, v in ipairs(buffers) do
      if v == bufnr then
        local prev_buf_idx = i == 1 and #buffers or (i - 1)
        local prev_buffer = buffers[prev_buf_idx]
        for _, win in ipairs(windows) do
          api.nvim_win_set_buf(win, prev_buffer)
        end
      end
    end
  end

  -- Check if buffer still exists, to ensure the target buffer wasn't killed
  -- due to options like bufhidden=wipe.
  if api.nvim_buf_is_valid(bufnr) and bo[bufnr].buflisted then
    vim.cmd(string.format('%s %d', kill_command, bufnr))
  end
end

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
  result = table.concat(result, ' ')
  return #result > 0 and result or ''
end

return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  version = 'v3.*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
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
        -- name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
        -- 	-- Remove extension from file name.
        -- 	return vim.fn.fnamemodify(buf.name, ":t:r")
        -- end,
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        truncate_names = true,  -- whether or not tab names should be truncated
        tab_size = 21,
        -- diagnostics = "nvim_lsp",
        -- diagnostics_update_in_insert = false,
        -- diagnostics_indicator = diagnostics_indicator,
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
        separator_style = 'padded_slope',
        hover = {
          enabled = true, -- requires nvim 0.8+
          delay = 200,
          reveal = { 'close' },
        },
        sort_by = 'id',
      },
    }
  end,
}
