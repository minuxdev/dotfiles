

local function map(mode, key, command)
	vim.keymap.set(mode, key, command, { silent = true })
end


vim.g.mapleader = " "

-- File Manager
map("i", "<C-s>", "<ESC> :w<CR>i")
map("i", "<C-u>", "<ESC> :u<CR>i")
map("i", "<C-r>", "<ESC> <C-r>i")
map("i", "<C-x>", "<ESC> :wq!<CR>")
map("n", "<a-x>", ":q<CR>")

-- Window Manager
-- navigation
map('n', "<a-s>", ":vsplit<CR>")
map('n', "<a-w>", ":split<CR>")
map("n", "<a-h>", "<C-w>h")
map("n", "<a-j>", "<C-w>j")
map("n", "<a-k>", "<C-w>k")
map("n", "<a-l>", "<C-w>l")

-- resiz
map("n", "<a-Up>", ":resize -2<CR>")
map("n", "<a-Down>", ":resize +2<CR>")
map("n", "<a-Left>", ":vertical resize +2<CR>")
map("n", "<a-Right>", ":vertical resize -2<CR>")

-- terminal
map("n", "<a-t>", ":term<CR>")

