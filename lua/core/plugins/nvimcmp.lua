return {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = 'InsertEnter',
    opts = {
        history = true,
        updateevents = 'TextChanged,TextChangedI',
    },
    dependencies = {
        { 'rafamadriz/friendly-snippets' },
        { 'L3MON4D3/LuaSnip' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'hrsh7th/cmp-nvim-lsp' },
        -- {
        --     'zbirenbaum/copilot-cmp',
        --     dependencies = 'copilot.lua',
        --     opts = {},
        --     config = function(_, opts)
        --         local copilot_cmp = require 'copilot_cmp'
        --         copilot_cmp.setup(opts)
        --         vim.api.nvim_create_autocmd('LspAttach', {
        --             callback = function(args)
        --                 local buffer = args.buf ---@type number
        --                 local client = vim.lsp.get_client_by_id(args.client_id)
        --                 if client.name == 'copilot' then
        --                     copilot_cmp._on_insert_enter {}
        --                 end
        --             end,
        --         })
        --     end,
        -- },
    },
    config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
    end,
}
