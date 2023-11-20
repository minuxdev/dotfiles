--Function for mapping
local function map(mode, key, command)
  vim.keymap.set(mode, key, command, { silent = true })
end

-- Defingin  leader key
vim.g.mapleader = ' '

-- Source file
map('n', '<leader>sf', ':source % <cr>')

-- panel management
map('n', '<leader>[', ':vsplit<CR>')
map('n', '<leader>]', ':split<CR>')
map('n', '<leader>=', ':<C-w>=')
map('n', '<leader>a', '<C-w>h')
map('n', '<leader>k', '<C-w>k')
map('n', '<leader>d', '<C-w>j')
map('n', '<leader>l', '<C-w>l')
map('n', '<leader>z', ':ZoomToggle<CR>')

-- file management
map('n', '<leader>ss', '<ESC> :w!<CR>')
map('n', '<leader>sk', '<ESC> :wq!<CR>')
map('n', '<leader>cv', ':qa!<CR>')
map('n', '<leader>q', ':bdelete!<CR>')
map('n', '<leader>ot', ':%bdelete!|edit #|normal`<CR>')
map('n', '<leader>w', ':bp<CR>')
map('n', '<leader>e', ':bn<CR>')

-- terminal
map('n', '<leader>rt', ':term<CR>i')
map('n', '<leader>or', ':!w | :e #<CR>')

-- resize
--map('n', '<a-Up>', ':resize -2<CR>')
--map('n', '<a-Down>', ':resize +2<CR>')
--map('n', '<a-Left>', ':vertical resize -2<CR>')
--map('n', '<a-Right>', ':vertical resize +2<CR>')

--
-- Tabs
--map('n', '<leader>tn', ':tabnew<cr>')
--map('n', '<leader>ti', ':tab split<cr>')

-- File Manager
--map('i', '<leader>g', ':g/%s/norm o%s')
