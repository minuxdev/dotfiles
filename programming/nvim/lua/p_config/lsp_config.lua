local status, mason = pcall(require, 'mason')

local lspconfig = require('lspconfig')

if not status then return end

mason.setup(
  {
    ui = {
      border = 'rounded',
      width  = 0.8,
      height = 0.6,
    }
  }
)
require('mason-lspconfig').setup({
  ensure_installed = { 'pyright', 'lua_ls', 'bashls', 'emmet_language_server', 'html', 'eslint' }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', 'ff', '<cmd>lua vim.lsp.buf.format()<cr>', {})
end

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'python' },
  settings = {
    pyright = {
      autoImportCompletion = true,
    }
  },
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  filetypes = { 'lua' },
})
lspconfig.bashls.setup({
  capabilities = capabilities,
  filetypes = { 'sh', 'zsh' },
})

lspconfig.html.setup({
  capabilities = capabilities,
  filetypes = { 'html' },
})
