local lspconfig = require("lspconfig")

local map = vim.api.nvim_set_keymap
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client)
  map("n", "gr", vim.lsp.buf.rename(), {})
  map("n", "ga", vim.lsp.buf.code_action(), {})
  map("n", "gd", vim.lsp.buf.definition(), {})
  map("n", "gi", vim.lsp.buf.implementation(), {})
  map("n", "H", vim.lsp.buf.hover(), {})
  map("n", "ff", "<cmd>lua vim.lsp.buf.format()<cr>", {})
end

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    pyright = {
      autoImportCompletion = true,
    },
  },
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  filetypes = { "lua" },
})
lspconfig.bashls.setup({
  capabilities = capabilities,
  filetypes = { "sh", "zsh" },
})

lspconfig.html.setup({
  capabilities = capabilities,
  filetypes = { "html" },
})
