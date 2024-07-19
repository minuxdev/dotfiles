-- Definging  initial options
local set = vim.opt

set.number = true
set.relativenumber = true
set.numberwidth = 4
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.clipboard = "unnamedplus" -- require wl-clipboard from AUR
set.ignorecase = true
set.smartcase = true
set.autoindent = true
set.swapfile = false
set.showcmd = true
set.laststatus = 2
set.autowrite = true
set.autoread = true
set.list = true
--set.showbreak = "↪"
set.fillchars = "vert: "

-- Commands
-- CursorLine
set.cursorline = true

vim.cmd([[
  augroup highlight_yank
    autocmd!
  augroup END
]])

-- Show characters
--vim.cmd([[
--set listchars=eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨,tab:•→
--]])
