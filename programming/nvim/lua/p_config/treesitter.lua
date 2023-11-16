require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'python', 'scss', 'html', 'javascript', 'typescript', 'css', 'bash',
  },

  sync_install = false,
  auto_install = true,
  hightlight = {
    enable = true,
  },
})
