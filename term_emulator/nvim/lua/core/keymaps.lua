
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local set = vim.opt

vim.g.mapleader = " "

-- Basic setups
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

-- File Manager
keymap("i", "<C-s>", "<ESC> :w<CR>i", opts)
keymap("i", "<C-z>", "<ESC> :u<CR>i", opts)
keymap("i", "<C-x>", "<ESC> :wq<CR>", opts)

---l aldkjfaldjf akdjfal df:kadsfjaldjfjadj

-- Window Manager
-- navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- resize
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical +2<CR>", opts)



