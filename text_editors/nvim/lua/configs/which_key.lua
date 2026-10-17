local s, wk = pcall(require, "which-key")

if not s then
	print("which-key not installed")
	return
end

vim.g.mapleader = " "
vim.o.timeout = true
vim.o.timeoutlen = 50

wk.setup({
	marks = true,
	register = true,
	presets = {
		motions = true,
		text_objects = true,
		windows = true,
		nav = true,
		z = true,
		g = true,
	},
	icons = {
		group = "+ ",
	},
	windows = {
		z_index = 1000,
		margin = { 1, 0, 1, 0 },
		padding = { 1, 2, 1, 2 },
		winblend = 0,
		border = "none",
	},
})
