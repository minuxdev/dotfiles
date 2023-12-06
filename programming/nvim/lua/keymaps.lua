--Function for mapping
local module = require("user_module.module")
local map = module.map


-- Defingin  leader key
vim.g.mapleader = " "

---- Source file
map("n", "<leader>sf", ":source % <cr>")

-- panel management
map("n", "<leader>[", ":vsplit<CR><C-w>l")
map("n", "<leader>]", ":split<CR><C-w>j")
map("n", "<leader>=", "<C-w>=")
map("n", "<leader>z", ":ZoomToggle<CR>")
map("n", "<leader>a", "<C-w>h")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>d", "<C-w>j")
map("n", "<leader>l", "<C-w>l")

-- file management
map("n", "<leader>ss", "<ESC> :w!<CR>")
map("n", "<leader>sk", "<ESC> :wq!<CR>")
map("n", "<leader>cv", ":qa!<CR>")
map("n", "<leader>q", ":bdelete!<CR>")
map("n", "<leader>ot", ":%bdelete!|edit #|normal`<CR>")
map("n", "<leader>w", ":bp<CR>")
map("n", "<leader>e", ":bn<CR>")

-- terminal
map("t", "'q", "exit<CR>")
map("t", "'a", "<C-w>h")
map("t", "'k", "<C-w>k")
map("t", "'d", "<C-w>j")
map("t", "'l", "<C-w>l")
vim.keymap.set("n", "<leader>o", "", { silent = true, callback = module.open_terminal })
vim.keymap.set("n", "<leader>r", "", { silent = true, callback = module.open_and_run })
