

local function map(mode, key, command)
	vim.keymap.set(mode, key, command, { silent = true })
end


vim.g.mapleader = " "

-- File Manager
map("i", "<C-s>", "<ESC> :w<CR>i")
map("i", "<C-u>", "<ESC> :u<CR>i")
map("i", "<C-r>", "<ESC> <C-r>")
map("i", "<C-x>", "<ESC> :wq!<CR>")

-- Window Manager
-- navigation
map('n', '<Leader>h', ":vsplit<CR>")
map('n', '<Leader>v', ":split<CR>")
map("n", "<Leader>hh", "<C-w>h")
map("n", "<Leader>jj", "<C-w>j")
map("n", "<Leader>kk", "<C-w>k")
map("n", "<Leader>ll", "<C-w>l")

-- resize
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")



