require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'python', 'scss', 'html', 'tsx', 'typescript', 'css'
  },

  sync_install = false,
  auto_install = true,
  hightlight = {
    enable = true,
  },
})
