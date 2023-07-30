vim.g.barbar_auto_setup = false
local status, error = pcall(require, 'barbar')
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--vim.cmd [[ BarbarEnable ]]
-- Tabs
map('n', '<leader>hh', '<cmd>BufferPrevious<cr>', opts)
map('n', '<leader>ll', '<cmd>BufferNext<cr>', opts)
map('n', '<leader>kf', '<cmd>BufferClose<cr>', opts)
map('n', '<leader>ko', '<cmd>BufferCloseAllButCurrent<cr>', opts)
map('n', '<leader>bf', '<Cmd>BufferPick<CR>', opts)

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Configurations
--
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
