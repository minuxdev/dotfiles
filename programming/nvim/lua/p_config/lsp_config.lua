require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'pyright', 'lua_ls', 'bashls', 'html', 'emmet_language_server' }
})




local format = require('lsp-format').setup {}
local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client)
  require('lsp-format').on_attach(client)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', 'ff', '<cmd>lua vim.lsp.buf.format()<cr>', {})
end

-- Lua
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'lua' },

  Lua = {
    workspace = { checkThirdParty = false },
    telemetry = { enable = false },
  }
}

-- HTML
lspconfig.html.setup {}
-- Enable SCSS filetype
vim.cmd('autocmd BufRead,BufNewFile *.scss set filetype=scss')
-- Enable HTML filetype
vim.cmd('autocmd BufRead,BufNewFile *.html set filetype=html')

-- Python
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'python' },
}
--
-- Shell
local augroup = vim.api.nvim_create_augroup("zshAsBash", {})
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup,
  pattern = { "*.sh", "*.zsh" },
  command = "silent! set filetype=sh",
})
lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'sh', 'zsh', 'bash' }

}
