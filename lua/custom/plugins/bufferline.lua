function buf_kill(kill_command, bufnr, force)
	kill_command = kill_command or "bd"

	local bo = vim.bo
	local api = vim.api
	local fmt = string.format
	local fn = vim.fn

	if bufnr == 0 or bufnr == nil then
		bufnr = api.nvim_get_current_buf()
	end

	local bufname = api.nvim_buf_get_name(bufnr)

	if not force then
		local choice
		if bo[bufnr].modified then
			choice = fn.confirm(fmt([[Save changes to "%s"?]], bufname), "&Yes\n&No\n&Cancel")
			if choice == 1 then
				vim.api.nvim_buf_call(bufnr, function()
					vim.cmd("w")
				end)
			elseif choice == 2 then
				force = true
			else
				return
			end
		elseif api.nvim_buf_get_option(bufnr, "buftype") == "terminal" then
			choice = fn.confirm(fmt([[Close "%s"?]], bufname), "&Yes\n&No\n&Cancel")
			if choice == 1 then
				force = true
			else
				return
			end
		end
	end

	-- Get list of windows IDs with the buffer to close
	local windows = vim.tbl_filter(function(win)
		return api.nvim_win_get_buf(win) == bufnr
	end, api.nvim_list_wins())

	if force then
		kill_command = kill_command .. "!"
	end

	-- Get list of active buffers
	local buffers = vim.tbl_filter(function(buf)
		return api.nvim_buf_is_valid(buf) and bo[buf].buflisted
	end, api.nvim_list_bufs())

	-- If there is only one buffer (which has to be the current one), vim will
	-- create a new buffer on :bd.
	-- For more than one buffer, pick the previous buffer (wrapping around if necessary)
	if #buffers > 1 and #windows > 0 then
		for i, v in ipairs(buffers) do
			if v == bufnr then
				local prev_buf_idx = i == 1 and #buffers or (i - 1)
				local prev_buffer = buffers[prev_buf_idx]
				for _, win in ipairs(windows) do
					api.nvim_win_set_buf(win, prev_buffer)
				end
			end
		end
	end

	-- Check if buffer still exists, to ensure the target buffer wasn't killed
	-- due to options like bufhidden=wipe.
	if api.nvim_buf_is_valid(bufnr) and bo[bufnr].buflisted then
		vim.cmd(string.format("%s %d", kill_command, bufnr))
	end
end

return {
	'akinsho/bufferline.nvim',
	version = "v3.*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require('bufferline').setup({
			-- highlights = require('catppuccin.groups.integrations.bufferline').get(),
			highlights = {
				background = {
					italic = true,
				},
				buffer_selected = {
					bold = true,
				},
			},
			options = {
				close_command = function(bufnr)
					buf_kill("bd", bufnr, false)
				end,
				indicator = {
					icon = require('icons').ui.BoldLineLeft,
					style = "icon",
				},
				buffer_close_icon = require('icons').ui.Close,
				modified_icon = require('icons').ui.Modified,
				close_icon = require('icons').ui.BoldClose,
				left_trunc_marker = require('icons').ui.ArrowCircleLeft,
				right_trunc_marker = require('icons').ui.ArrowCircleRight,
				name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
					-- remove extension from markdown files for example
					if buf.name:match "%.md" then
						return vim.fn.fnamemodify(buf.name, ":t:r")
					end
				end,
				max_name_length = 18,
				max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
				truncate_names = true, -- whether or not tab names should be truncated
				tab_size = 18,
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						separator = false, -- use a "true" to enable the default, or set your own character
						padding = 1,
					},
					{
						filetype = "undotree",
						text = "Undotree",
						highlight = "PanelHeading",
						padding = 1,
					},
					{
						filetype = "NvimTree",
						text = "Explorer",
						highlight = "PanelHeading",
						padding = 1,
					},
					{
						filetype = "DiffviewFiles",
						text = "Diff View",
						highlight = "PanelHeading",
						padding = 1,
					},
					{
						filetype = "flutterToolsOutline",
						text = "Flutter Outline",
						highlight = "PanelHeading",
					},
					{
						filetype = "lazy",
						text = "Lazy",
						highlight = "PanelHeading",
						padding = 1,
					},
				},
				color_icons = true, -- whether or not to add the filetype icon highlights
				show_buffer_icons = true,
				show_close_icon = false,
				show_tab_indicators = true,
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				-- can also be a table containing 2 custom separators
				-- [focused and unfocused]. eg: { '|', '|' }
				separator_style = "thin",
				enforce_regular_tabs = false,
				always_show_bufferline = false,
				hover = {
					enabled = false, -- requires nvim 0.8+
					delay = 200,
					reveal = { "close" },
				},
				sort_by = "id",
			}
		})
	end,
}
