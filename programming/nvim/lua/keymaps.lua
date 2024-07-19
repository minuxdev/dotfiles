local s, wk = pcall(require, "which-key")
if not s then
	return
end

local _, utils = pcall(require, "configs.utils")
if not _ then
	print("utils not loaded")
end

-- Telescope
local telescope = utils.telescope

wk.register({
	-- buffer management
	b = {
		name = "Buffers",
		s = { ":w!<cr>", "Save" },
		q = { ":wq!<cr>", "Save and quit" },
		k = { ":qa!<cr>", "Force quit all without saving" },
		c = { ":bdelete!<cr>", "Close buffer" },
		o = { ":%bdelete!|edit #|normal`<cr>", "Close all but current buffer" },
		a = { ":bp<cr>", "Prev buffer" },
		l = { ":bn<cr>", "Next buffer" },
	},

	-- Telescope
	f = {
		name = "Telescope",
		f = { telescope.builtin().find_files, "Find files" },
		l = { telescope.builtin().live_grep, "Open recent files" },
		o = { telescope.builtin().oldfiles, "Open old files" },
		k = { telescope.builtin().keymaps, "Show keymaps" },
		c = { telescope.builtin().colorscheme, "Set colorscheme" },
		e = { ":Telescope file_browser<cr>", "Toggle file browser" },
	},

	-- window management
	w = {
		name = "Windows",
		h = { ":vsplit<cr><c-w>l", "Horizontal Split" },
		v = { ":split<cr><c-w>j", "Vertical Split" },
		f = { ":ZoomToggle<cr>", "Focus on selected pane" },
		a = { "<c-w>h", "Go to left pane" },
		l = { "<c-w>l", "Go to right pane" },
		k = { "<c-w>k", "Go to up pane" },
		d = { "<c-w>d", "Go to down pane" },
	},

	--- lspsaga
	l = {
		name = "Lspsaga",
		c = { ":Lspsaga code_action<cr>", "Code action" },
		o = { ":Lspsaga outline<cr>", "Outline" },
		r = { ":Lspsaga rename<cr>", "Rename" },
		f = { ":Lspsaga finder<cr>", "Finder" },
		p = { ":Lspsaga preview_definition<cr>", "Preview definition" },
		h = { ":Lspsaga signature_help<cr>", "Signature help" },
		g = { ":Lspsaga goto_definition<cr>", "Go to definition" },
		s = { ":Lspsaga show_buf_diagnostics<cr>", "Show buffer diagnostics" },
		w = { ":Lspsaga show_workspace_diagnostics<cr>", "Show workspace diagnostics" },
		t = { ":Lspsaga term_toggle<cr>", "Term toggle" },
	},
}, { prefix = "<leader>" })

vim.keymap.set("n", "fr", ":source %<cr>", { noremap = true, silent = true })
--
--
