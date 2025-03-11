return {
  "folke/snacks.nvim",
  ---@module 'lua.snacks'
  ---@type snacks.Config
  opts = {
    picker = {},
    explorer = {},
    notifier = {},
    statuscolumn = {},
    indent = {
      hl = {
        "SnacksIndent1",
        "SnacksIndent2",
        "SnacksIndent3",
        "SnacksIndent4",
        "SnacksIndent5",
        "SnacksIndent6",
        "SnacksIndent7",
        "SnacksIndent8",
      },
      chunk = {
        -- when enabled, scopes will be rendered as chunks, except for the
        -- top-level scope which will be rendered as a scope.
        enabled = true,
        -- only show chunk scopes in the current window
        only_current = false,
        priority = 200,
        hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
        char = {
          corner_top = "╭",
          corner_bottom = "╰",
          horizontal = "─",
          vertical = "│",
          arrow = "❯",
        },
      },
      -- animate scopes. Enabled by default for Neovim >= 0.10
      -- Works on older versions but has to trigger redraws during animation.
      ---@class snacks.indent.animate: snacks.animate.Config
      ---@field enabled? boolean
      --- * out: animate outwards from the cursor
      --- * up: animate upwards from the cursor
      --- * down: animate downwards from the cursor
      --- * up_down: animate up or down based on the cursor position
      ---@field style? "out"|"up_down"|"down"|"up"
      animate = {
        enabled = vim.fn.has("nvim-0.10") == 1,
        style = "out",
        easing = "linear",
        duration = {
          step = 20,   -- ms per step
          total = 250, -- maximum duration
        },
      },
    },
  },
  keys = {
    -- Top Pickers & Explorer
    { "<leader><space>", function() require('snacks').picker.smart() end,                                   desc = "Smart Find Files" },
    { "<leader>,",       function() require('snacks').picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>/",       function() require('snacks').picker.grep() end,                                    desc = "Grep" },
    { "<leader>:",       function() require('snacks').picker.command_history() end,                         desc = "Command History" },
    -- find
    { "<leader>fb",      function() require('snacks').picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>fc",      function() require('snacks').picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff",      function() require('snacks').picker.files() end,                                   desc = "Find Files" },
    { "<leader>fg",      function() require('snacks').picker.git_files() end,                               desc = "Find Git Files" },
    { "<leader>fp",      function() require('snacks').picker.projects() end,                                desc = "Projects" },
    { "<leader>fr",      function() require('snacks').picker.recent() end,                                  desc = "Recent" },
    -- git
    { "<leader>gb",      function() require('snacks').picker.git_branches() end,                            desc = "Git Branches" },
    { "<leader>gl",      function() require('snacks').picker.git_log() end,                                 desc = "Git Log" },
    { "<leader>gL",      function() require('snacks').picker.git_log_line() end,                            desc = "Git Log Line" },
    { "<leader>gs",      function() require('snacks').picker.git_status() end,                              desc = "Git Status" },
    { "<leader>gS",      function() require('snacks').picker.git_stash() end,                               desc = "Git Stash" },
    { "<leader>gd",      function() require('snacks').picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
    { "<leader>gf",      function() require('snacks').picker.git_log_file() end,                            desc = "Git Log File" },
    -- Grep
    { "<leader>sb",      function() require('snacks').picker.lines() end,                                   desc = "Buffer Lines" },
    { "<leader>sB",      function() require('snacks').picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
    { "<leader>sg",      function() require('snacks').picker.grep() end,                                    desc = "Grep" },
    { "<leader>sw",      function() require('snacks').picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { '<leader>s"',      function() require('snacks').picker.registers() end,                               desc = "Registers" },
    { '<leader>s/',      function() require('snacks').picker.search_history() end,                          desc = "Search History" },
    { "<leader>sb",      function() require('snacks').picker.lines() end,                                   desc = "Buffer Lines" },
    { "<leader>sc",      function() require('snacks').picker.command_history() end,                         desc = "Command History" },
    { "<leader>sC",      function() require('snacks').picker.commands() end,                                desc = "Commands" },
    { "<leader>sd",      function() require('snacks').picker.diagnostics() end,                             desc = "Diagnostics" },
    { "<leader>sh",      function() require('snacks').picker.help() end,                                    desc = "Help Pages" },
    { "<leader>sH",      function() require('snacks').picker.highlights() end,                              desc = "Highlights" },
    { "<leader>sj",      function() require('snacks').picker.jumps() end,                                   desc = "Jumps" },
    { "<leader>sk",      function() require('snacks').picker.keymaps() end,                                 desc = "Keymaps" },
    { "<leader>sl",      function() require('snacks').picker.loclist() end,                                 desc = "Location List" },
    { "<leader>sm",      function() require('snacks').picker.marks() end,                                   desc = "Marks" },
    { "<leader>sM",      function() require('snacks').picker.man() end,                                     desc = "Man Pages" },
    { "<leader>sq",      function() require('snacks').picker.qflist() end,                                  desc = "Quickfix List" },
    { "<leader>sR",      function() require('snacks').picker.resume() end,                                  desc = "Resume" },
    { "<leader>uC",      function() require('snacks').picker.colorschemes() end,                            desc = "Colorschemes" },
    -- LSP
    { "gd",              function() require('snacks').picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gD",              function() require('snacks').picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "gr",              function() require('snacks').picker.lsp_references() end,                          nowait = true,                     desc = "References" },
    { "gI",              function() require('snacks').picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "gy",              function() require('snacks').picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    { "<leader>ss",      function() require('snacks').picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>sS",      function() require('snacks').picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
  }
}
