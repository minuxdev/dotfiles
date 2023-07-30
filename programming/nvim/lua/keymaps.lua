-- Function for mapping
local function map(mode, key, command)
  vim.keymap.set(mode, key, command, { silent = true })
end

-- Defingin  leader key
vim.g.mapleader = ' '

-- Source file
map('n', '<leader>sf', ':source % <cr>')

-- Window Manager
-- panel management
map('n', '<leader><leader>i', ':vsplit<CR>')
map('n', '<leader><leader>o', ':split<CR>')
map('n', '<leader><leader>h', '<C-w>h')
map('n', '<leader><leader>j', '<C-w>j')
map('n', '<leader><leader>k', '<C-w>k')
map('n', '<leader><leader>l', '<C-w>l')
map('n', '<leader><leader>x', ':only<CR>')

-- Tabs
map('n', '<leader>tn', ':tabnew<cr>')
map('n', '<leader>ti', ':tab split<cr>')
-- map('n', '<leader>hh', ':-tabnext<cr>')
-- map('n', '<leader>ll', ':-tabnext<cr>')
-- map('n', '<leader>qq', ':tabclose<cr>')
-- map('n', '<leader>oq', ':tabonly<cr>')

-- File Manager
map('n', '<leader>ss', '<ESC> :w!<CR>')
map('n', '<leader>uu', '<ESC> :u<CR>')
map('n', '<leader>rr', '<ESC> <C-r>')
map('n', '<leader>sk', '<ESC> :wq!<CR>')
map('n', '<leader>cv', ':qa!<CR>')

-- resize
map('n', '<a-Up>', ':resize -2<CR>')
map('n', '<a-Down>', ':resize +2<CR>')
map('n', '<a-Left>', ':vertical resize -2<CR>')
map('n', '<a-Right>', ':vertical resize +2<CR>')

-- terminal
map('n', '<meader>tt', ':term<CR>i')
map('n', '<leader>tl', ':vsplit term<CR>i')


-- Insert Mod
--map('i', '<C-/>', ':<ESC>I#<ESC>')
