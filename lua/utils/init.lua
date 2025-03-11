local M = {}

M.load_autocmds = function(custom_event_groups)
  local core_event_groups = require('core.autocmds')
  local event_groups = vim.tbl_deep_extend("force", core_event_groups,
    custom_event_groups ~= nil and custom_event_groups or {})

  for event, autocmds in pairs(event_groups) do
    for _, autocmd in ipairs(autocmds) do
      vim.api.nvim_create_autocmd(event, autocmd)
    end
  end
end

M.load_mappings = function(custom_mappings)
  local core_mappings = require('core.keymaps')
  local mappings = vim.tbl_deep_extend("force", core_mappings, custom_mappings ~= nil and custom_mappings or {})

  vim.schedule(function()
    for key, value in pairs(mappings) do
      local mode = value[1]
      local cmd = value[2]
      local opts = value[3] or {}

      if cmd == nil then
        print('No command for mapping: ' .. key, mode, opts)
        return
      end

      vim.keymap.set(mode, key, cmd, opts)
    end
  end)
end

M.switch_to_buffer = function(dir)
  return function()
    if dir == 'prev' then
      vim.cmd.bprevious()
    elseif dir == 'next' then
      vim.cmd.bnext()
    end
  end
end

M.move_line = function(numlns)
  return function()
    vim.cmd.m(numlns)
  end
end

M.switch_to_split = function(dir)
  return function()
    local buftype = vim.bo.buftype
    if buftype == nil then
      vim.cmd.write()
    end
    vim.cmd.wincmd(dir)
  end
end

-- Source: https://github.com/NvChad/NvChad/blob/v2.0/lua/core/utils.lua
M.lazy_load = function(plugin)
  vim.api.nvim_create_autocmd({ 'BufRead', 'BufWinEnter', 'BufNewFile' }, {
    group = vim.api.nvim_create_augroup('BeLazyOnFileOpen' .. plugin, {}),
    callback = function()
      local file = vim.fn.expand '%'
      local condition =
          file ~= 'neo-tree' and
          file ~= '[lazy]' and
          file ~= ''

      if condition then
        vim.api.nvim_del_augroup_by_name('BeLazyOnFileOpen' .. plugin)

        -- dont defer for treesitter as it will show slow highlighting
        -- This deferring only happens only when we do "nvim filename"
        if plugin ~= 'nvim-treesitter' then
          vim.schedule(function()
            require('lazy').load { plugins = plugin }

            if plugin == 'nvim-lspconfig' then
              vim.cmd 'silent! do FileType'
            end
          end)
        else
          require('lazy').load { plugins = plugin }
        end
      end
    end,
  })
end

M.get_char_count = function()
  local current_pos = vim.api.nvim_win_get_cursor(0)

  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  -- Calculate start and end positions in terms of lines and columns
  local start_row, start_col = start_pos[2] - 1, start_pos[3] - 1 -- 0-indexed for Lua API
  local end_row, end_col = end_pos[2] - 1, end_pos[3]

  -- Get the selected text without altering the current visual selection
  local selected_text = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {})
  local char_count = #table.concat(selected_text, "")

  vim.fn.setreg("*", char_count)
  vim.fn.setreg("+", char_count)

  -- Restore the cursor position
  vim.api.nvim_win_set_cursor(0, current_pos)

  -- Calculate the position for the floating window
  --- @type vim.api.keyset.win_config
  local win_opts = {
    relative = "cursor",
    row = 0,
    col = 2,
    width = #tostring(" " .. char_count .. " Characters "),
    height = 1,
    style = "minimal",
    border = "rounded",
  }

  -- Create a buffer and set its content to the message
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { " " .. char_count .. " Characters " })

  -- Open a floating window to display the message
  local win = vim.api.nvim_open_win(buf, false, win_opts)

  -- Close the window after a short delay
  vim.defer_fn(function()
    vim.api.nvim_win_close(win, true)
  end, 2000) -- Close after 2000ms (2 seconds)  return #concat_selected
end

M.insert_empty_line = function(position)
  local count = vim.v.count > 0 and vim.v.count or 1 -- Use the count or default to 1
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local row, col = unpack(cursor_pos);

  vim.schedule(function()
    local current_line = vim.fn.line(".") -- Get the current cursor line
    local lines_to_add = vim.fn.map(vim.fn.range(count), function() return "" end)

    if position == "above" then
      vim.api.nvim_buf_set_lines(0, current_line - 1, current_line - 1, false, lines_to_add)
    elseif position == "below" then
      vim.api.nvim_buf_set_lines(0, current_line, current_line, false, lines_to_add)
      row = row + #lines_to_add
    else
      vim.notify("Invalid position. Use 'above' or 'below'.", vim.log.levels.ERROR)
    end
    vim.api.nvim_win_set_cursor(0, { row, col })
  end)
end

M.get_line_count = function()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  -- Calculate start and end positions in terms of lines and columns
  local start_row, start_col = start_pos[2] - 1, start_pos[3] - 1 -- 0-indexed for Lua API
  local end_row, end_col = end_pos[2] - 1, end_pos[3]

  -- Get the selected text without altering the current visual selection
  local selected_text = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {})
  local line_count = #selected_text
  local output = " " .. line_count .. " lines. "

  --- @type vim.api.keyset.win_config
  local win_opts = {
    relative = "cursor",
    row = 0,
    col = 2,
    width = #tostring(output),
    height = 1,
    style = "minimal",
    border = "rounded"
  }

  -- Create a buffer and set its content to the message
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { output })

  -- Open a floating window to display the message
  local win = vim.api.nvim_open_win(buf, false, win_opts)

  -- Close the window after a short delay
  vim.defer_fn(function()
    vim.api.nvim_win_close(win, true)
  end, 2000) -- Close after 2000ms (2 seconds)  return #concat_selected
end

return M
