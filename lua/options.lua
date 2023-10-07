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
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.completeopt = 'menuone,noselect'

vim.opt.termguicolors = true

vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"
-- vim.opt.listchars:append "space:⋅"

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.cursorlineopt = "both"
vim.wo.signcolumn = 'yes'

-- Shell Configuration
vim.o.shell = 'pwsh'
vim.o.shellxquote = ''
vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
vim.o.shellquote = ''
vim.o.shellpipe = '| Out-File -Encoding UTF8 %s'
vim.o.shellredir = '| Out-File -Encoding UTF8 %s'


vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Goneovim Configs
vim.o.guifont = "FastaqueSansMono NFM:n"
