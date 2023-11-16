-- Definging  initial options
local set = vim.opt


set.number = true
set.relativenumber = true
set.numberwidth = 4
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.clipboard = 'unnamedplus' -- require wl-clipboard from AUR
set.ignorecase = true
set.smartcase = true
set.autoindent = true
set.swapfile = false
set.showcmd = true
set.laststatus = 2
set.autowrite = true
set.autoread = true
set.list = true
set.showbreak = '↪'
set.fillchars = "vert:|"


-- Commands
-- CursorLine
set.cursorline = true

vim.cmd [[
  augroup highlight_yank
    autocmd!
  augroup END
]]

-- Show characters
vim.cmd [[
    set listchars=eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
  ]]


-- Python specific sets
local filetype = vim.bo.filetype
if filetype == 'python' then
  vim.cmd [[
    set listchars=tab:→\ ,eol:↲
  ]]

  vim.cmd [[
    let python_highlight_all = 1
    au Filetype python
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=79 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal fileformat=unix |
    \ setlocal colorcolumn=80 |
  ]]
end
