require("nvim-tree").setup {}
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable highlight groups
vim.opt.termguicolors = true

-- toggle NvimTreeToggle
vim.keymap.set("n", "<Leader>e", ":NvimTreeFindFileToggle<CR>")

