local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("*", { capabilities = capabilities })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.client_id)
    local bufnr = args.buf

    if client and client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      })
    end
  end
})

-- Js files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  callback = function()
    pcall(function()
      vim.lsp.buf.code_action({
        context = { only = { "source.fixAll.eslint" } },
        apply = true
      })
    end)
  end
})
-- lua
vim.lsp.config("lua_ls", {
  filetypes = { "lua" },
})

-- shell
vim.lsp.config("bashls", {
  filetypes = { "sh", "zsh" },
})

-- yaml
vim.lsp.config("yamlls", {
  settings = {
    yaml = { format = { enable = true } }
  }
})

-- toml
vim.lsp.config("taplo", {
  filetypes = { "toml" }
})

-- ts_ls
vim.lsp.config("ts_ls", {
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
})

-- eslint
vim.lsp.config("eslint", {
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  cmd = { "eslint-language-server", "--stdio" },
})
-- Enable
vim.lsp.enable({ "lua_ls", "bashls", "yamlls", "taplo", "eslint", "ts_ls" })
