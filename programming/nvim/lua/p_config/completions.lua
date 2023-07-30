require('luasnip.loaders.from_vscode').lazy_load()
local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<c-b>'] = cmp.mapping.scroll_docs(-4),
    ['<c-f>'] = cmp.mapping.scroll_docs(4),
    --    ['<c-t>'] = cmp.mapping.complete(),
    ['<c-e>'] = cmp.mapping.abort(),
    ['<cr>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true }),
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
    {
      { name = 'buffer' },
    }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },

  preselect = cmp.PreselectMode.Item,

})
