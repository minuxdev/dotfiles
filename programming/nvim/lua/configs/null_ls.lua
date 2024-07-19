local ns, null_ls = pcall(require, "null-ls")

if not ns then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	-- diagnostics
	diagnostics.shellcheck, -- for shellscript
	diagnostics.selene, -- for lua
	diagnostics.flake8.with({ -- for python
		diagnostic_config = {
			underline = true,
			virtual_text = false,
			severity_sort = true,
		},
		extra_args = { "--max-complexity", "3" },
	}),

	-- formatting
	formatting.djlint.with({
		filetypes = { "djangohtml", "jinja2", "django" }, -- for django
	}),
	formatting.black.with({
		extra_args = { "--quiet", "--line-length", "79" }, -- for python
	}),

	formatting.prettier.with({
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"json",
			"css",
			"html",
			"scss",
		},
	}),
	formatting.stylua,
}

null_ls.setup({
	debug = true,
	sources = sources,

	on_attach = function(client, bufnr)
		if client.name == "tsserver" then
			client.server_capabilities.documentFormattingProvider = false
		end

		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
