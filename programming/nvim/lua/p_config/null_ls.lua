local null_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completions = null_ls.builtins.completion

local sources = {

  -- diagnostics
  diagnostics.flake8.with({ -- for python
    diagnostic_config = {
      underline = true,
      virtual_text = false,
      severity_sort = true,
    },
    extra_args = { '--max-complexity', '3' }
  }),

  -- formatters
  formatting.djlint.with({
    filetypes = { 'djangohtml', 'jinja2', 'django' }, -- for django
  }),
  formatting.black.with({
    extra_args = { '--quiet', '--line-length', '79' } -- for python
  }),
  formatting.prettier,                                -- for most of front-end languages
  formatting.lua_format,                              -- for lua
  formatting.eslint,

}

null_ls.setup({
  debug = true,
  sources = sources,

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.cmd [[
          autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
      ]]
    end
  end,
})
