local M = {}

M.highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
M.bufcheck_group = vim.api.nvim_create_augroup("bufcheck", { clear = true })
M.deferclip_group = vim.api.nvim_create_augroup("deferClip", { clear = true })

return M
