vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half-Page Down and Center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half-Page Up and Center' })

-- Buffer keymaps
local switch_to_buffer = function(dir)
    return function()
        if dir == 'prev' then
            vim.cmd.bprevious()
        elseif dir == 'next' then
            vim.cmd.bnext()
        end
    end
end
vim.keymap.set('n', '<S-l>', switch_to_buffer('next'))
vim.keymap.set('n', '<S-h>', switch_to_buffer('prev'))

-- Register keymaps
-- Allows replacing highlighted text with yanked text without replacing yanked text from register.
vim.keymap.set('x', '<leader>p', '"_dP')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')
vim.keymap.set('n', '<leader>dw', 'viwd', { desc = "Deletes word under cursor" });
vim.keymap.set('n', '<leader>cw', 'viwc', { desc = "Del + Insert Mode word under cursor" });

local move_line = function(numlns)
    return function()
        vim.cmd.m(numlns)
    end
end

-- Line Navigation keymaps
vim.keymap.set('v', "<A-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set('v', "<A-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('n', '<A-Up>', move_line('-2'))
vim.keymap.set('n', '<A-Down>', move_line('+1'))

vim.keymap.set('n', "J", "mzJ`z")
vim.keymap.set('n', '<C-e>', ':!')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'n', 'nzzzv')


-- Split Keymaps
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

vim.keymap.set('n', '<C-Left>', switch_to_split('h'))
vim.keymap.set('n', '<C-Down>', switch_to_split('j'))
vim.keymap.set('n', '<C-Up>', switch_to_split('k'))
vim.keymap.set('n', '<C-Right>', switch_to_split('l'))
vim.keymap.set('n', '<C-c>', '<C-w>c')

-- Git keymaps
vim.keymap.set('n', '<leader>ga', ':Git add .<CR>', { desc = '[G]it [A]dd' })
vim.keymap.set('n', '<leader>gs', ':Git status <CR>', { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gd', ':Git diff<CR>', { desc = '[G]it [D]iff' })
vim.keymap.set('n', '<leader>gc', [[:Git commit -m ''<Left>]], { desc = '[G]it [C]ommit' })
vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { desc = '[G]it [P]ush' })
vim.keymap.set('n', '<leader>gl', ':Git pull<CR>', { desc = '[G]it Pu[l]l' })
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { desc = '[G]it [B]lame' })
vim.keymap.set('n', '<leader>gf', ':Git fetch<CR>', { desc = '[G]it [F]etch' })
vim.keymap.set('n', '<leader>gr', ':Git rebase<CR>', { desc = '[G]it [R]ebase' })
vim.keymap.set('n', '<leader>gL', ':Git log --graph --pretty=oneline<CR>', { desc = '[G]it [L]og' })

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<leader>Rr', [[:s/\<<C-r><C-w>\>/<C-r><C-w>/<Left>]], { desc = "Replace under cursor" })
vim.keymap.set('n', '<leader>Rg', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace all occurrences under cursor" })
vim.keymap.set('n', '<C-v>', vim.cmd.v)
-- Fightin' one-eyed Kirby (Collects highlighted text and allows you to store it for use in the substitution using \1)
vim.keymap.set('v', '<leaker>Rk', [[:s/\(\w.*\)/]], { desc = "Store and Replace (Fighting one-eyed Kirby)" })

vim.keymap.set('n', '<C-x>', '<cmd>ToggleTerm<CR>', { desc = "Toggle Terminal" });

vim.keymap.set('t', '<C-x>', '<C-\\><C-n><cmd>ToggleTerm<CR>')
vim.keymap.set('t', 'jk', [[<C-\><C-n>]])

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Trouble Keymaps
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle Trouble", silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { desc = "Toggle Trouble Workspace Diagnostics", silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
    { desc = "Toggle Trouble Document Diagnostics", silent = true, noremap = true })
vim.keymap.set("n", "<leader>t", "<cmd>TroubleToggle loclist<cr>",
    { desc = "Toggle Trouble Location List", silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    { desc = "Toggle Trouble Quickfix", silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
    { desc = "Toggle Trouble LSP References", silent = true, noremap = true })
