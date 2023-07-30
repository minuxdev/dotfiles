-- Function for mapping
local function map(mode, key, command)
  vim.keymap.set(mode, key, command, { silent = true })
end

-- Defingin  leader key
vim.g.mapleader = ' '

-- Source file
map('', '<leader>sf', ':source % <cr>')

-- Window Manager
-- panel management
map('', '<leader><leader>i', ':vsplit<CR>')
map('', '<leader><leader>o', ':split<CR>')
map('', '<leader><leader>h', '<C-w>h')
map('', '<leader><leader>j', '<C-w>j')
map('', '<leader><leader>k', '<C-w>k')
map('', '<leader><leader>l', '<C-w>l')

-- Tabs
map('n', '<leader>tn', ':tabnew<cr>')
map('n', '<leader>ti', ':tab split<cr>')
-- map('n', '<leader>hh', ':-tabnext<cr>')
-- map('n', '<leader>ll', ':-tabnext<cr>')
-- map('n', '<leader>qq', ':tabclose<cr>')
-- map('n', '<leader>oq', ':tabonly<cr>')

-- File Manager
map('', '<leader>ss', '<ESC> :w!<CR>')
map('', '<leader>uu', '<ESC> :u<CR>')
map('', '<leader>rr', '<ESC> <C-r>')
map('', '<leader>sk', '<ESC> :wq!<CR>')
map('', '<leader>cv', ':qa!<CR>')

-- resize
map('n', '<a-Up>', ':resize -2<CR>')
map('n', '<a-Down>', ':resize +2<CR>')
map('n', '<a-Left>', ':vertical resize -2<CR>')
map('n', '<a-Right>', ':vertical resize +2<CR>')

-- terminal
map('', '<meader>tt', ':term<CR>i')
map('', '<leader>tl', ':vsplit term<CR>i')


-- Insert Mod
--map('i', '<C-/>', ':<ESC>I#<ESC>')