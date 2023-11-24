return {
  'zbirenbaum/copilot-cmp',
  dependencies = 'copilot.lua',
  opts = {},
  config = function(_, opts)
    local copilot_cmp = require 'copilot_cmp'
    copilot_cmp.setup(opts)
    -- attach cmp source whenever copilot attaches
    -- fixes lazy-loading issues with the copilot cmp source

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local buffer = args.buf ---@type number
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.name == 'copilot' then
          copilot_cmp._on_insert_enter {}
        end
      end,
    })
  end,
}
-- return {
-- 	"zbirenbaum/copilot-cmp",
-- 	after = { "copilot.lua" },
-- 	config = function()
-- 		require("copilot_cmp").setup({
-- 			suggestion = {
-- 				auto_trigger = true
-- 			}
-- 		})
-- 	end,
-- }
