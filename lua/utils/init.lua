local M = {}

M.load_autocmds = function(event_groups)
  for event, autocmds in pairs(event_groups) do
    for _, autocmd in ipairs(autocmds) do
      vim.api.nvim_create_autocmd(event, autocmd)
    end
  end
end

M.load_mappings = function(mappings)
  for mode, mapping in pairs(mappings) do
    for key, value in pairs(mapping) do
      local cmd = value[1]
      local opts = value[2] or {}
      vim.keymap.set(mode, key, cmd, opts)
    end
  end
end

return M
