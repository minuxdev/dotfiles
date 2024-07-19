local status, ts = pcall(require, "nvim-treesitter.configs")

if not status then
	return
end

ts.setup({
	--auto_install = true,
	highlight = { enable = true, disable = {} },
	indent = { enable = true, disable = {} },
	ensure_installed = {
		"bash",
		"markdown",
		"markdown_inline",
		"tsx",
		"javascript",
		"css",
		"html",
		"lua",
		"htmldjango",
	},
})
