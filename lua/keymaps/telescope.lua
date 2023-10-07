-- See `:help telescope.builtin`
local builtin = require('telescope.builtin')
local mappings = {
    n = {
        ['<leader>sr'] = { builtin.oldfiles, { desc = 'Find [r]ecently opened files' } },
        ['<leader>sf'] = { builtin.find_files, { desc = '[S]earch [F]iles' } },
        ['<leader>sh'] = { builtin.help_tags, { desc = '[S]earch [H]elp' } },
        ['<leader>sw'] = { builtin.grep_string, { desc = '[S]earch current [W]ord' } },
        ['<leader>sg'] = { builtin.live_grep, { desc = '[S]earch by [G]rep' } },
        ['<leader>sd'] = { builtin.diagnostics, { desc = '[S]earch [D]iagnostics' } },
        ['<leader><space>'] = { builtin.buffers, { desc = '[ ] Find existing buffers' } },
        ['<leader>/'] = {
            function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end,
            { desc = '[/] Fuzzily search in current buffer' },
        },
    }
}

return mappings
