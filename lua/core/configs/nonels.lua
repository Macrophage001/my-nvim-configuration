local mason_null_ls = require('mason-null-ls')
local null_ls = require('null-ls')
local null_ls_utils = require('null-ls.utils')

mason_null_ls.setup({
  ensure_installed = {
    -- 'prettier',  -- js formatter'
    'stylua', -- lua formatter
    'black',  -- python formatter
    'pylint', -- python linter
    'eslint_d',
  },
})

local formatting = null_ls.builtins.formatting   -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

-- configure null_ls
local opts = {
  root_dir = null_ls_utils.root_pattern('.null-ls-root', 'Makefile', '.git', 'package.json'),
  sources = {
    -- formatting.prettier,
    formatting.stylua, -- lua formatter
    formatting.isort,
    formatting.black,
    diagnostics.pylint,
    diagnostics.eslint_d,
  },
  -- configure format on save
  on_attach = function(current_client, bufnr)
    if current_client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}

return opts
