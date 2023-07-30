vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    width = 30,
    number = true,
  },
  renderer = {
    highlight_opened_files = 'icon',
  },
  actions = {
    open_file = {
      resize_window = true,
      quit_on_open = true,
    },
  },
  filters = {
    dotfiles = false,
  }
})


-- enable highlight groups
vim.opt.termguicolors = true

-- toggle NvimTreeToggle
vim.keymap.set("n", "<Leader>e", ":NvimTreeFindFileToggle<CR>")
