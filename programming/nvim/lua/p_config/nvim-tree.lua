vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local width = 70
local height = 30
local gw = vim.api.nvim_list_uis()[1].width
local gh = vim.api.nvim_list_uis()[1].height

require("nvim-tree").setup({
  view = {
    width = 50,
    number = true,
    relativenumber = true,
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = {
        width = width,
        height = height,
        col = (gw - width) * 0.5,
        row = (gh - height) * 0.5,
      },
    }
  },
  renderer = {
    highlight_opened_files = 'icon',
  },
  actions = {
    open_file = {
      resize_window = false,
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
