local status, mason = pcall(require, "mason")
if not status then
	return
end

mason.setup({
	ui = {
		border = "rounded",
		width = 0.8,
		height = 0.6,
	},
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"pyright",
		"lua_ls",
		"bashls",
		"emmet_language_server",
		"html",
		"eslint",
	},
})

local _st, m_null = pcall(require, "mason-null-ls")
if not _st then
	return
end

m_null.setup({
	ensure_installed = {
		"jq",
		"prettier",
		"selene",
		"shellcheck",
		"stylua",
		"djlint",
		"flake8",
		"black",
		"isort",
		"eslint",
		"shfmt",
	},
	handlers = {},
})
