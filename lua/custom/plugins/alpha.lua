local if_nil = vim.F.if_nil
local icons = require('icons')
local banners = require('banners')

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 5,
		width = 50,
		align_shortcut = "right",
		hl_shortcut = "Keyword",
	}

	if keybind then
		keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

local function get_date()
	return os.date("%a %d %b %I:%M %p")
end

local function get_plugin_count()
	local plugins_count = vim.fn.len(vim.fn.globpath("~/AppData/Local/nvim-data/lazy/", "*", 0, 1))
	return plugins_count
end

local function get_neovim_version()
	local version = vim.version()
	return string.format("%d.%d.%d", version.major, version.minor, version.patch)
end

local function get_lua_version()
	return vim.api.nvim_call_function("luaeval", { "_VERSION" })
end

local header = {
	type = "text",
	val = banners.dashboard(),
	opts = {
		position = "center",
		hl = "Type",
	},
}

local buttons = {
	type = "group",
	val = {
		button("e", icons.kind.File .. " New file", "<cmd>ene <CR>"),
		button("f", icons.ui.Search .. " Find file", "<cmd>Telescope find_files<CR>"),
		button("r", icons.misc.Clock .. " Recently opened files", "<cmd>Telescope oldfiles<CR>"),
		button("g s", icons.git.Octoface .. " Git status", "<cmd>Git status<CR>"),
		button("q", icons.ui.Close .. " Quit", "<cmd>qa<CR>"),
	},
	opts = {
		spacing = 1,
	},
}

local footer = {
	type = "text",
	val =
		[[ ╰  Neovim v]] .. get_neovim_version() ..
		[[  ]] .. get_lua_version() ..
		[[  Plugins: ]] .. get_plugin_count() .. [[  ]] .. get_date() .. [[]],
	opts = {
		position = "center",
		hl = "Number",
	},
}

local section = {
	header = header,
	buttons = buttons,
	footer = footer,
}

local config = {
	layout = {
		{ type = "padding", val = 2 },
		section.header,
		{ type = "padding", val = 2 },
		section.buttons,
		section.footer,
	},
	opts = {
		margin = 5,
	},
}

return {
	"goolord/alpha-nvim",
	config = function()
		require('alpha').setup(config)
	end
}
