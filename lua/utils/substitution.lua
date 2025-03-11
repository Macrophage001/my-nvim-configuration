local M = {}

-- Source: https://github.com/gbprod/substitute.nvim/blob/main/lua/substitute/utils.lua
local function get_default_register()
  local clipboard_flags = vim.split(vim.api.nvim_get_option("clipboard"), ",")

  if vim.tbl_contains(clipboard_flags, "unnamedplus") then
    return "+"
  end

  if vim.tbl_contains(clipboard_flags, "unnamed") then
    return "*"
  end

  return '"'
end

M.substitute_operator = function(type)
  -- Get the range of the motion
  local start_row, start_col = unpack(vim.api.nvim_buf_get_mark(0, '['))
  local end_row, end_col = unpack(vim.api.nvim_buf_get_mark(0, ']'))

  -- Adjust `end_col` for different motion types
  if type == 'line' then
    start_col = 0
    end_col = -1          -- Delete the entire line range
  elseif type == 'char' then
    end_col = end_col + 1 -- Include the last character in the motion
  end

  -- Get the replacement content
  local reg_content = vim.fn.getreg(get_default_register()) -- This is what causes that delay.
  if not reg_content or reg_content == "" then
    vim.notify("Register is empty. Substitution skipped.", vim.log.levels.WARN)
    return
  end

  local replacement_lines = vim.split(reg_content, "\n", { plain = true })

  -- Delete the existing text and replace it with the new content
  vim.api.nvim_buf_set_text(0, start_row - 1, start_col, end_row - 1, end_col, replacement_lines)

  -- Highlight the replaced text
  local ns_id = vim.api.nvim_create_namespace('substitute_highlight')
  local new_end_row = start_row - 1 + #replacement_lines - 1
  local new_end_col = #replacement_lines[#replacement_lines]
  if #replacement_lines > 1 then
    new_end_col = #replacement_lines[#replacement_lines] - 1
  else
    new_end_col = start_col + #replacement_lines[#replacement_lines] - 1
  end

  vim.highlight.range(
    0,
    ns_id,
    'IncSearch',
    { start_row - 1, start_col },
    { new_end_row, new_end_col },
    { inclusive = true }
  )

  -- Clear the highlight after a brief duration
  vim.defer_fn(function()
    vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
  end, 150)
end

return M
