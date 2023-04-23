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
vim.opt.updatetime = 50
vim.opt.completeopt = 'menuone,noselect'

vim.opt.termguicolors = true

-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#C8D3F5 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#7A88CF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#7a88cf gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#7A88CF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#C8D3F5 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#7A88CF gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "space:⋅"

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
