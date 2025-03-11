local groups = require("core.augroups")

local M = {}

M.TextYankPost = {
  {
    pattern = '*',
    callback = function()
      vim.highlight.on_yank()
    end,
    group = groups.highlight_group,
  }
}

M.LspAttach = {
  {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client == nil then
        return
      end

      -- if client.server_capabilities.signatureHelpProvider then
      --   require('lsp-overloads').setup(client, {})
      -- end
    end
  }
}

M.BufReadPost = {
  {
    group = groups.bufcheck_group,
    pattern = '*',
    callback = function()
      if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
        vim.fn.setpos('.', vim.fn.getpos("'\""))
        vim.api.nvim_feedkeys('zz', 'n', true)
      end
    end
  }
}

M.FocusGained = {
  {
    group = groups.deferclip_group,
    pattern = "*",
    command = [[call setreg("@", getreg("+"))]],
  }
}

M.FocusLost = {
  {
    pattern = "*",
    command = [[call setreg("+", getreg("@"))]],
  }
}

return M
