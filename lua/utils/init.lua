local M = {}

M.default_mappings = {}
M.default_mappings.mt = {}
M.default_mappings.mt.__index = function(table, key)
  if key == nil then
    error("Key has to be a valid vim mode", 2)
  end
  if key ~= "n" or key ~= "i" or key ~= "v" or key ~= "x" or key ~= "o" or key ~= "t" then
    error("Key has to be a valid vim mode", 2)
  end
  return table[key] or {}
end

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
      if cmd == nil then
        print("No command for mapping: " .. key, mode, opts)
      end
      vim.keymap.set(mode, key, cmd, opts)
    end
  end
end


-- Source: https://github.com/NvChad/NvChad/blob/v2.0/lua/core/utils.lua
M.lazy_load = function(plugin)
  vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
    callback = function()
      local file = vim.fn.expand "%"
      local condition = file ~= "neo-tree" and file ~= "[lazy]" and file ~= ""

      if condition then
        vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)

        -- dont defer for treesitter as it will show slow highlighting
        -- This deferring only happens only when we do "nvim filename"
        if plugin ~= "nvim-treesitter" then
          vim.schedule(function()
            require("lazy").load { plugins = plugin }

            if plugin == "nvim-lspconfig" then
              vim.cmd "silent! do FileType"
            end
          end, 0)
        else
          require("lazy").load { plugins = plugin }
        end
      end
    end,
  })
end
return M
