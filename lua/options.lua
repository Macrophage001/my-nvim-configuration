vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.mouse = 'a'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.completeopt = 'menuone,noselect'
vim.opt.laststatus = 3
vim.opt.splitkeep = 'screen'
vim.opt.clipboard = ""

vim.opt.termguicolors = true

vim.opt.list = true
-- vim.opt.listchars:append "eol:↵"
-- vim.opt.listchars:append "space:⋅"

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.cursorlineopt = 'both'
vim.wo.signcolumn = 'yes'
vim.wo.conceallevel = 2
vim.wo.concealcursor = 'c'

-- Shell Configuration
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.shell = 'pwsh'
vim.o.shellxquote = ''
vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
vim.o.shellquote = ''
vim.o.shellpipe = '| Out-File -Encoding UTF8 %s'
vim.o.shellredir = '| Out-File -Encoding UTF8 %s'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.editorconfig = 1
vim.g.swapfile = false
vim.g.undotree_DiffCommand = "fc"

-- Zig
vim.g.zig_fmt_autosave = 0

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h11"
end
