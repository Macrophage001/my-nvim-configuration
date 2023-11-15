local groups = require("core.augroups")

return {
  TextYankPost = {
    {
      callback = function()
        vim.highlight.on_yank()
      end,
      group = groups.highlight_group,
      pattern = '*',
    }
  },
  LspAttach = {
    {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.signatureHelpProvider then
          require('lsp-overloads').setup(client, {})
        end
      end
    }
  },
  BufReadPost = {
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
}
