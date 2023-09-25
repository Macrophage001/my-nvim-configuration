-- HELPER FUNCTIONS --
local switch_to_buffer = function(dir)
    return function()
        if dir == 'prev' then
            vim.cmd.bprevious()
        elseif dir == 'next' then
            vim.cmd.bnext()
        end
    end
end

local move_line = function(numlns)
    return function()
        vim.cmd.m(numlns)
    end
end

local switch_to_split = function(dir)
    return function()
        local buftype = vim.bo.buftype
        if (buftype == nil) then
            vim.cmd.write()
            print("Saving buffer: " .. vim.bo.path)
        end
        print(vim.bo.buftype);
        vim.cmd.wincmd(dir)
    end
end

-- @type table
-- @see vim.keymap
-- @alias mappings
-- @field n table Normal mode mappings
-- @field i table Insert mode mappings
-- @field v table Visual mode mappings
-- @field x table Visual-block mode mappings
local mappings = {
    n = {
        ['<leader><space>r'] = { '<cmd>bufdo LspRestart<CR>', { silent = true } },

        ['<Space>'] = { '<Nop>', { silent = true } },
        ['<Tab>'] = { vim.cmd.NeoTreeFocusToggle, { desc = "Open Neotree" } },
        ['k'] = { "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true } },
        ['j'] = { "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true } },
        ['<C-d>'] = { '<C-d>zz', { desc = 'Half-Page Down and Center' } },
        ['<C-u>'] = { '<C-u>zz', { desc = 'Half-Page Up and Center' } },
        ['<S-l>'] = { switch_to_buffer('next') },
        ['<S-h>'] = { switch_to_buffer('prev') },
        ['<leader>y'] = { '"+y' },
        ['<leader>Y'] = { '"+Y' },

        ['yd'] = { 'yyp', { desc = "Duplicate Line" } },
        ['<leader>d'] = { '"_d' },
        ['<leader>dw'] = { '"_diw', { desc = "Deletes word under cursor" } },
        ['<leader>cw'] = { 'ciw', { desc = "Cut word under cursor" } },
        ['<leader>rw'] = { '"_diwp', { desc = "Replace word under cursor with yanked text" } },
        ['<leader>rW'] = { '"_diwP', { desc = "Replace word under cursor with yanked text" } },

        -- Whole Buffer Keymaps
        ['<leader>cf'] = { 'ggcG<C-o>zz', { desc = "Cut whole buffer" } },
        ['<leader>df'] = { 'ggdG<C-o>zz', { desc = "Delete whole buffer" } },
        ['<leader>rf'] = { 'ggpG<C-o>zz', { desc = "Replace whole buffer with yanked text" } },
        ['<leader>yf'] = { 'ggyG<C-o>zz', { desc = "Yank whole buffer" } },
        ['<A-Up>'] = { move_line('-2'), { silent = true } },
        ['<A-Down>'] = { move_line('+1'), { silent = true } },

        ["J"] = { "mzJ`z" },
        ['<C-e>'] = { ':!' },
        ['N'] = { 'Nzzzv' },
        ['n'] = { 'nzzzv' },

        -- Split Keymaps
        ['<C-Left>'] = { switch_to_split('h') },
        ['<C-Down>'] = { switch_to_split('j') },
        ['<C-Up>'] = { switch_to_split('k') },
        ['<C-Right>'] = { switch_to_split('l') },
        ['<C-c>'] = { '<C-w>c' },

        -- Git keymaps
        ['<leader>ga'] = { ':Git add .<CR>', { desc = '[G]it [A]dd' } },
        ['<leader>gs'] = { ':Git status <CR>', { desc = '[G]it [S]tatus' } },
        ['<leader>gd'] = { ':Git diff<CR>', { desc = '[G]it [D]iff' } },
        ['<leader>gc'] = { [[:Git commit -m ''<Left>]], { desc = '[G]it [C]ommit' } },
        ['<leader>gp'] = { ':Git push<CR>', { desc = '[G]it [P]ush' } },
        ['<leader>gP'] = { ':Git pull<CR>', { desc = '[G]it Pu[l]l' } },
        ['<leader>gb'] = { ':Git blame<CR>', { desc = '[G]it [B]lame' } },
        ['<leader>gf'] = { ':Git fetch<CR>', { desc = '[G]it [F]etch' } },
        ['<leader>gr'] = { ':Git rebase<CR>', { desc = '[G]it [R]ebase' } },
        ['<leader>gl'] = { ':Git log --graph --pretty=oneline<CR>', { desc = '[G]it [L]og' } },
        ['<leader>u'] = { vim.cmd.UndotreeToggle },
        ['<C-x>'] = { '<cmd>ToggleTerm<CR>', { desc = "Toggle Terminal" }, },
        ['[d'] = { vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" } },
        [']d'] = { vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" } },
        ['<leader>e'] = { vim.diagnostic.open_float, { desc = "Open floating diagnostic message" } },
        ['<leader>q'] = { vim.diagnostic.setloclist, { desc = "Open diagnostics list" } },

        -- Trouble Keymaps
        ['<leader>xx'] = { "<cmd>TroubleToggle<cr>", { desc = "Toggle Trouble", silent = true, noremap = true } },
        ['<leader>xw'] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", {
            desc = "Toggle Trouble Workspace Diagnostics", silent = true, noremap = true } },
        ['<leader>xd'] = { "<cmd>TroubleToggle document_diagnostics<cr>", {
            desc = "Toggle Trouble Document Diagnostics",
            silent = true,
            noremap = true
        } },
        ['<leader>t'] = { "<cmd>TroubleToggle loclist<cr>", {
            desc = "Toggle Trouble Location List",
            silent = true,
            noremap = true
        } },
        ['<leader>xq'] = { "<cmd>TroubleToggle quickfix<cr>", {
            desc = "Toggle Trouble Quickfix",
            silent = true,
            noremap = true
        } },
        ['gR'] = { "<cmd>TroubleToggle lsp_references<cr>", {
            desc = "Toggle Trouble LSP References",
            silent = true,
            noremap = true
        } },

        -- Goto-Preview Keymaps
        ['gp'] = { "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", {
            desc = "Goto Preview Definition",
            silent = true,
            noremap = true
        } },
        ['gi'] = { "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", {
            desc = "Goto Preview Implementation", silent = true, noremap = true } },
        ['gP'] = { "<cmd>lua require('goto-preview').close_all_win()<cr>", {
            desc = "Close All Goto Preview Windows",
            silent = true,
            noremap = true
        } },
        ['<leader>z'] = { "<cmd>ZenMode<CR>", { silent = true } }
    },
    v = {
        ['<leader>d'] = { '"_d' },
        ['<leader>y'] = { '"+y' },

        -- Line Navigation keymaps
        ['<A-Up>'] = { ":m '<-2<CR>gv=gv" },
        ['<A-Down>'] = { ":m '>+1<CR>gv=gv" },
        ['<'] = { '<gv' },
        ['>'] = { '>gv' },
    },
    x = {
        -- Allows replacing highlighted text with yanked text without replacing yanked text from register.
        ['p'] = { '"_dP' },
    },
    t = {
        -- Git keymaps
        ['<C-x>'] = { '<C-\\><C-n><cmd>ToggleTerm<CR>' },
        ['jk'] = { [[<C-\><C-n>]] },
    }
}

return mappings
