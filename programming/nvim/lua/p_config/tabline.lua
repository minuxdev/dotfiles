vim.g.barbar_auto_setup = false
local status, error = pcall(require, 'barbar')
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--vim.cmd [[ BarbarEnable ]]
-- Tabs
map('n', '<leader>hh', '<cmd>BufferPrevious<cr>', opts)
map('n', '<leader>ll', '<cmd>BufferNext<cr>', opts)
map('n', '<leader>pb', '<Cmd>BufferPick<CR>', opts)

-- Configurations
require('barbar').setup({
  animation = true,
  auto_hide = false,
  clickable = true,
  tabpages = true,
  current = { buffer_index = true },
  inactive = { button = 'x' },
  visible = { modiefied = { buffer_number = false } },
  --hide = { extensions = true, incative = true },
  highlight_visible = true,
  icons = {
    preset = 'slanted',
  }
})
