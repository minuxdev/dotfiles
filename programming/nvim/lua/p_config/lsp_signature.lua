local sig = pcall(require, "lsp_signature")
local cfg = {
	bind = true,
	floating_window = true,
	hint_prefix = "󰏚 ",
	hint_enable = true,
	handler_opts = {
		border = "rounded",
	},
}

require("lsp_signature").setup(cfg)
