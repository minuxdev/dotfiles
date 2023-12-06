require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'python', 'scss', 'html', 'javascript', 'typescript', 'css', 'bash',
  },

  sync_install = false,
  auto_install = true,
  indent = {
    enable = true,
  },
  hightlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  autopairs = {
    enable = true,
  }
})
