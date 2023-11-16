local null_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
local code_actions = null_ls.builtins.code_actions

local sources = {
  formatting.prettier,
  formatting.black.with({
    extra_args = { '--fast' },
    filetypes = { 'python' }
  }),
  diagnostics.flake8,
}

null_ls.setup({
  debug = true,
  sources = sources,

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end
      })
    end
  end,
})
