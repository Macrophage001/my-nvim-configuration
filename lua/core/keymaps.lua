local telescope_builtin = require 'telescope.builtin'
local switch_to_buffer = require('utils').switch_to_buffer
local move_line = require('utils').move_line
local switch_to_split = require('utils').switch_to_split

local M = {}

M.n = {
  ['<Esc>'] = { ':noh <CR>', { desc = 'Clear Highlights', silent = true } },
  ['<C-s>'] = { ':w <CR>', { desc = 'Save File', silent = true } },

  ['<leader><space>r'] = { '<cmd>bufdo LspRestart<CR>', { silent = true } },
  ['<Space>'] = { '<Nop>', { silent = true } },
  ['<Tab>'] = { vim.cmd.NeoTreeFocusToggle, { desc = 'Toggle Neotree' } },
  ['k'] = { "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true } },
  ['j'] = { "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true } },
  ['<C-d>'] = { '<C-d>zz', { desc = 'Half-Page Down and Center' } },
  ['<C-u>'] = { '<C-u>zz', { desc = 'Half-Page Up and Center' } },
  ['<S-l>'] = { switch_to_buffer 'next' },
  ['<S-h>'] = { switch_to_buffer 'prev' },
  ['<leader>y'] = { '"+y' },
  ['<leader>Y'] = { '"+Y' },

  ['yd'] = { 'yyp', { desc = 'Duplicate Line' } },
  ['yD'] = { 'yyP', { desc = 'Duplicate Line' } },

  ['<leader>d'] = { '"_d' },
  ['<leader>dw'] = { '"_diw', { desc = 'Deletes word under cursor' } },
  ['<leader>cw'] = { 'ciw', { desc = 'Cut word under cursor' } },
  ['<leader>rw'] = { '"_diwp', { desc = 'Replace word under cursor with yanked text' } },
  ['<leader>rW'] = { '"_diwP', { desc = 'Replace word under cursor with yanked text' } },

  -- Whole Buffer Keymaps
  ['<leader>cf'] = { 'ggcG<C-o>zz', { desc = 'Cut whole buffer' } },
  ['<leader>df'] = { 'ggdG<C-o>zz', { desc = 'Delete whole buffer' } },
  ['<leader>rf'] = { 'ggpG<C-o>zz', { desc = 'Replace whole buffer with yanked text' } },
  ['<leader>yf'] = { 'ggyG<C-o>zz', { desc = 'Yank whole buffer' } },
  ['<A-Up>'] = { move_line '-2', { silent = true } },
  ['<A-Down>'] = { move_line '+1', { silent = true } },

  ['J'] = { 'mzJ`z' },
  ['<C-e>'] = { ':!' },
  ['N'] = { 'Nzzzv' },
  ['n'] = { 'nzzzv' },

  -- Split Keymaps
  ['<C-Left>'] = { switch_to_split 'h' },
  ['<C-Down>'] = { switch_to_split 'j' },
  ['<C-Up>'] = { switch_to_split 'k' },
  ['<C-Right>'] = { switch_to_split 'l' },
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
  ['<leader>t'] = { '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' } },
  ['[d'] = { vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' } },
  [']d'] = { vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' } },
  ['<leader>e'] = { vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' } },
  ['<leader>q'] = { vim.diagnostic.setloclist, { desc = 'Open diagnostics list' } },

  -- Trouble Keymaps
  ['<leader>xx'] = { '<cmd>TroubleToggle<cr>', { desc = 'Toggle Trouble', silent = true, noremap = true } },
  ['<leader>xw'] = {
    '<cmd>TroubleToggle workspace_diagnostics<cr>',
    {
      desc = 'Toggle Trouble Workspace Diagnostics',
      silent = true,
      noremap = true,
    },
  },
  ['<leader>xd'] = {
    '<cmd>TroubleToggle document_diagnostics<cr>',
    {
      desc = 'Toggle Trouble Document Diagnostics',
      silent = true,
      noremap = true,
    },
  },
  ['<leader>xq'] = { '<cmd>TroubleToggle quickfix<cr>', {
    desc = 'Toggle Trouble Quickfix',
    silent = true,
    noremap = true,
  } },
  ['gR'] = { '<cmd>TroubleToggle lsp_references<cr>', {
    desc = 'Toggle Trouble LSP References',
    silent = true,
    noremap = true,
  } },

  -- Goto-Preview Keymaps
  ['gp'] = {
    "<cmd>lua require('goto-preview').goto_preview_definition()<cr>",
    {
      desc = 'Goto Preview Definition',
      silent = true,
      noremap = true,
    },
  },
  ['gi'] = {
    "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>",
    {
      desc = 'Goto Preview Implementation',
      silent = true,
      noremap = true,
    },
  },
  ['gP'] = {
    "<cmd>lua require('goto-preview').close_all_win()<cr>",
    {
      desc = 'Close All Goto Preview Windows',
      silent = true,
      noremap = true,
    },
  },
  ['<leader>z'] = { '<cmd>ZenMode<CR>', { silent = true } },
  ['<leader>cu'] = { "<cmd>%s/\\u\\(\\x\\{4\\}\\)/\\=nr2char('0x'.submatch(1),1)/g<CR>", {
    desc = 'Convert Unicode',
    silent = true,
  } },
  ['<leader>ss'] = { [[<cmd>lua require("persistence").load()<cr>]] },
  ['<leader>sl'] = { [[<cmd>lua require("persistence").load({ last = true } })<cr>]] },
  ['<leader>ol'] = { '<cmd>AerialToggle<cr>', { desc = 'Toggle outline view', silent = true } },

  -- Telescope Keymaps
  ['<leader>sr'] = { telescope_builtin.oldfiles, { desc = 'Find [r]ecently opened files' } },
  ['<leader>sf'] = { telescope_builtin.find_files, { desc = '[S]earch [F]iles' } },
  ['<leader>sh'] = {
    telescope_builtin.help_tags,
    { desc = '[S]earch [H]elp' },
  },
  ['<leader>sw'] = { telescope_builtin.grep_string, { desc = '[S]earch current [W]ord' } },
  ['<leader>sg'] = { telescope_builtin.live_grep, { desc = '[S]earch by [G]rep' } },
  ['<leader>sd'] = { telescope_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' } },
  ['<leader><space>'] = { telescope_builtin.buffers, { desc = '[ ] Find existing buffers' } },
  ['<leader>/'] = {
    function()
      telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end,
    { desc = '[/] Fuzzily search in current buffer' },
  },
}
M.v = {
  ['<leader>d'] = { '"_d' },
  ['<leader>y'] = { '"+y' },

  -- Line Navigation keymaps
  ['<A-Up>'] = { ":m '<-2<CR>gv=gv" },
  ['<A-Down>'] = { ":m '>+1<CR>gv=gv" },
  ['<'] = { '<gv' },
  ['>'] = { '>gv' },
}
M.x = {
  -- Allows replacing highlighted text with yanked text without replacing yanked text from register.
  ['p'] = { '"_dP' },
}
M.t = {
  -- Git keymaps
  ['<leader>t'] = { '<C-\\><C-n><cmd>ToggleTerm<CR>' },
  ['jk'] = { [[<C-\><C-n>]] },
}

return M
