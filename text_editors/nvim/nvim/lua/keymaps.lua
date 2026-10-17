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

wk.add({
	mode = { "n", "v" },
	-- buffer management
	{ "<leader>b", group = "BUffers" },
	{ "<leader>bs", ":w!<cr>", desc = "Save" },
	{ "<leader>bq", ":wq!<cr>", desc = "Save and quit" },
	{ "<leader>bk", ":qa!<cr>", desc = "Force quit all without saving" },
	{ "<leader>bc", ":bdelete!<cr>", desc = "Close buffer" },
	{ "<leader>bo", ":%bdelete!|edit #|normal`<cr>", desc = "Close all but current buffer" },
	{ "<leader>ba", ":bp<cr>", desc = "Prev buffer" },
	{ "<leader>bl", ":bn<cr>", desc = "Next buffer" },

	-- Telescope
	{ "<leader>f", group = "Telescope" },
	{ "<leader>ff", telescope.builtin().find_files, desc = "Find files" },
	{ "<leader>fl", telescope.builtin().live_grep, desc = "Open recent files" },
	{ "<leader>fo", telescope.builtin().oldfiles, desc = "Open old files" },
	{ "<leader>fk", telescope.builtin().keymaps, desc = "Show keymaps" },
	{ "<leader>fc", telescope.builtin().colorscheme, desc = "Set colorscheme" },
	{ "<leader>fe", ":Telescope file_browser<cr>", desc = "Toggle file browser" },

	-- window management
	{ "<leader>w", group = "Windows" },
	{ "<leader>wh", ":vsplit<cr><c-w>l", desc = "Horizontal Split" },
	{ "<leader>wv", ":split<cr><c-w>j", desc = "Vertical Split" },
	{ "<leader>wf", ":ZoomToggle<cr>", desc = "Focus on selected pane" },
	{ "<leader>wa", "<c-w>h", desc = "Go to left pane" },
	{ "<leader>wl", "<c-w>l", desc = "Go to right pane" },
	{ "<leader>wk", "<c-w>k", desc = "Go to up pane" },
	{ "<leader>wd", "<c-w>d", desc = "Go to down pane" },

	--- lspsaga
	{ "<leader>l", group = "Lspsaga" },
	{ "<leader>lc", ":Lspsaga code_action<cr>", desc = "Code action" },
	{ "<leader>lo", ":Lspsaga outline<cr>", desc = "Outline" },
	{ "<leader>lr", ":Lspsaga rename<cr>", desc = "Rename" },
	{ "<leader>lf", ":Lspsaga finder<cr>", desc = "Finder" },
	{ "<leader>lp", ":Lspsaga preview_definition<cr>", desc = "Preview definition" },
	{ "<leader>lh", ":Lspsaga signature_help<cr>", desc = "Signature help" },
	{ "<leader>lg", ":Lspsaga goto_definition<cr>", desc = "Go to definition" },
	{ "<leader>ls", ":Lspsaga show_buf_diagnostics<cr>", desc = "Show buffer diagnostics" },
	{ "<leader>lw", ":Lspsaga show_workspace_diagnostics<cr>", desc = "Show workspace diagnostics" },
	{ "<leader>lt", ":Lspsaga term_toggle<cr>", desc = "Term toggle" },
	{ prefix = "<leader>" },
})
