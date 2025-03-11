-- local telescope_builtin = require 'telescope.builtin'
local switch_to_buffer = require('utils').switch_to_buffer
local switch_to_split = require('utils').switch_to_split

local M = {
    ['-']           = { { "n" }, '<Cmd>Oil<CR>', { desc = "Open Parent Directory" } },

    ['<Esc>']       = { { "n" }, ':noh <CR>', { desc = 'Clear Highlights', silent = true } },
    ['<C-s>']       = { { "n" }, ':w <CR>', { desc = 'Save File', silent = true } },

    ['<Space>']     = { { "n" }, '<Nop>', { silent = true } },
    ['k']           = { { "n" }, "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true } },
    ['j']           = { { "n" }, "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true } },
    ['<C-d>']       = { { "n" }, '<C-d>zz', { desc = 'Half-Page Down and Center' } },
    ['<C-u>']       = { { "n" }, '<C-u>zz', { desc = 'Half-Page Up and Center' } },
    ['<S-l>']       = { { "n" }, switch_to_buffer 'next' },
    ['<S-h>']       = { { "n" }, switch_to_buffer 'prev' },

    ['yd']          = { { "n" }, 'mayyp`a', { desc = 'Duplicate Line Down' } },
    ['yD']          = { { "n" }, 'mayyP`a', { desc = 'Duplicate Line Up' } },

    ['yc']          = { { "n" }, [[yy<cmd>lua require("Comment.api").comment.linewise()<CR>p]], { desc = "Duplicate and Comment Out Above", silent = true } },
    ['yC']          = { { "n" }, [[yy<cmd>lua require("Comment.api").comment.linewise()<CR>P]], { desc = "Duplicate and Comment Out Below", silent = true } },

    ['<leader>d']   = { { "n", "v" }, '"_d' },

    -- Whole Buffer keymaps
    ['<leader>bd']  = { { "n" }, '<cmd>Bdelete!<CR>', { desc = "Delete current buffer" } },

    ['<leader>cf']  = { { "n" }, '<cmd>%c<cr>', { desc = 'Cut whole buffer' } },
    ['<leader>df']  = { { "n" }, '<cmd>%d_<cr>', { desc = 'Delete whole buffer' } },
    ['<leader>rf']  = { { "n" }, 'ggpG<C-o>zz', { desc = 'Replace whole buffer with yanked text' } },
    ['<leader>yf']  = { { "n" }, '<cmd>%y<cr>', { desc = 'Yank whole buffer' } },

    ['<A-Down>']    = { { "n" }, ":m +1<CR>gv=gv", { silent = true, expr = true } },
    ['<A-Up>']      = { { "n" }, ":m -2<CR>gv=gv", { silent = true, expr = true } },

    ['J']           = { { "n" }, 'mzJ`z' },
    ['N']           = { { "n" }, 'Nzzzv' },
    ['n']           = { { "n" }, 'nzzzv' },

    -- Split Keymaps
    ['<C-Left>']    = { { "n" }, switch_to_split 'h' },
    ['<C-Down>']    = { { "n" }, switch_to_split 'j' },
    ['<C-Up>']      = { { "n" }, switch_to_split 'k' },
    ['<C-Right>']   = { { "n" }, switch_to_split 'l' },
    ['<C-c>']       = { { "n" }, '<C-w><C-c>' },

    -- Git keymaps
    ['<leader>gg']  = { { "n" }, ':Git<cr>', { silent = true, desc = "Open Fugitive" } },
    ['<leader>ga']  = { { "n" }, ':Git add .<CR>', { silent = true, desc = '[G]it [A]dd' } },
    ['<leader>gs']  = { { "n" }, ':Git status <CR>', { silent = true, desc = '[G]it [S]tatus' } },
    ['<leader>gd']  = { { "n" }, ':Git diff<CR>', { silent = true, desc = '[G]it [D]iff' } },
    ['<leader>gc']  = { { "n" }, [[:Git commit -m ''<Left>]], { desc = '[G]it [C]ommit' } },
    ['<leader>gp']  = { { "n" }, ':Git push<CR>', { silent = true, desc = '[G]it [P]ush' } },
    ['<leader>gP']  = { { "n" }, ':Git pull<CR>', { silent = true, desc = '[G]it Pu[l]l' } },
    ['<leader>gb']  = { { "n" }, ':Git blame<CR>', { silent = true, desc = '[G]it [B]lame' } },
    ['<leader>gf']  = { { "n" }, ':Git fetch<CR>', { silent = true, desc = '[G]it [F]etch' } },
    ['<leader>gr']  = { { "n" }, ':Git rebase<CR>', { silent = true, desc = '[G]it [R]ebase' } },
    ['<leader>gl']  = { { "n" }, ':Git log --graph --pretty=oneline<CR>', { silent = true, desc = '[G]it [L]og' } },

    ['<leader>u']   = { { "n" }, vim.cmd.UndotreeToggle },

    ['<leader>t']   = { { "n" }, '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' } },

    ['[d']          = { { "n" }, vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' } },
    [']d']          = { { "n" }, vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' } },

    ['<leader>e']   = { { "n" }, vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' } },
    ['<leader>q']   = { { "n" }, vim.diagnostic.setloclist, { desc = 'Open diagnostics list' } },

    ['<leader>O']   = { { "n" }, function() require('utils').insert_empty_line('above') end, { desc = "Insert line above cursor", silent = true } },
    ['<leader>o']   = { { "n" }, function() require('utils').insert_empty_line('below') end, { desc = "Insert line below cursor", silent = true } },

    ['<leader>ss']  = { { "n" }, [[<cmd>lua require("persistence").load()<cr>]] },
    ['<leader>sl']  = { { "n" }, [[<cmd>lua require("persistence").load({ last = true } })<cr>]] },

    ['<leader>sol'] = { { "n" }, '<cmd>Lspsaga outline<cr>', { desc = 'Toggle outline view', silent = true } },

    -- Mini.Pick
    ['<leader>ff']  = { { "n" }, ":Pick files<cr>", { desc = '[S]earch [F]iles' } },

    -- Telescope Keymaps
    -- ['<leader>sr']       = { { "n" }, telescope_builtin.oldfiles, { desc = 'Find [r]ecently opened files' } },
    -- ['<leader>sf']       = { { "n" }, function() telescope_builtin.find_files { previewer = false } end, { desc = '[S]earch [F]iles' } },
    -- ['<leader>sh']       = { { "n" }, function() telescope_builtin.help_tags { previewer = false } end, { desc = '[S]earch [H]elp' } },
    -- ['<leader>sw']       = { { "n" }, telescope_builtin.grep_string, { desc = '[S]earch current [W]ord' } },
    -- ['<leader>sg']       = { { "n" }, telescope_builtin.live_grep, { desc = '[S]earch by [G]rep' } },
    -- ['<leader>sd']       = { { "n" }, telescope_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' } },
    -- ['<leader><leader>'] = { { "n" }, telescope_builtin.buffers, { desc = '[ ] Find existing buffers' } },
    -- ['<leader>/']        = { { "n" },
    --     function()
    --         telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    --             winblend = 10,
    --             previewer = false,
    --         })
    --     end,
    --     { desc = '[/] Fuzzily search in current buffer' },
    -- },
    -- ['<leader>sc']       = { { "n" },
    --     function()
    --         telescope_builtin.find_files {
    --             cwd = vim.fn.stdpath("config")
    --         }
    --     end
    -- },

    -- Substitution Keymaps
    ['s']           = { { "n", "v" }, function()
        vim.opt.operatorfunc = "v:lua.require'utils.substitution'.substitute_operator"
        vim.api.nvim_feedkeys('g@', 'mi', false)
    end, { desc = "Substitute", silent = true } },

    ['ss']          = { { "n" }, function()
        vim.opt.operatorfunc = "v:lua.require'utils.substitution'.substitute_operator"
        vim.api.nvim_feedkeys('_g@$', 'mi', false)
    end, { desc = "Substitute Line", silent = true } },

    ['S']           = { { "n" }, function()
        vim.opt.operatorfunc = "v:lua.require'utils.substitution'.substitute_operator"
        vim.api.nvim_feedkeys('g@$', 'mi', false)
    end, { desc = "Substitute Until End of Line", silent = true } },

    ['<leader>y']   = { { "v" }, '"+y' },
    ['<leader>c']   = { { "v" }, [[:lua require("utils").get_char_count()<cr>]], { desc = "Gets number of characters selected", silent = true } },
    ['<leader>l']   = { { "v" }, [[:lua require("utils").get_line_count()<cr>]], { desc = "Gets number of lines selected", silent = true } },

    -- Line Navigation keymaps
    ['<Tab>']       = { { "n" }, ":Neotree toggle<cr>", { desc = "Toggle Neotree", silent = true } },

    ['<A-j>']       = { { "v" }, ":m '>+1<CR>gv=gv", { silent = true } },
    ['<A-k>']       = { { "v" }, ":m '<-2<CR>gv=gv", { silent = true } },
    ['<']           = { { "v" }, '<gv' },
    ['>']           = { { "v" }, '>gv' },
    ['p']           = { { "x" }, '"_dP' },
    ['jk']          = { { "t" }, [[<C-\><C-n>]] },
}

return M;
