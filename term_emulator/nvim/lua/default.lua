
local set = vim.opt


-- init configurations

set.number = true
set.relativenumber = true
set.cursorline = true
set.numberwidth = 4
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.clipboard = 'unnamedplus'
set.ignorecase = true
set.smartcase = true
set.autoindent = true



vim.cmd [[
    au BufNewFile, BufRead *.py 
        \ setlocal tabstop=4 | 
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
        \ setlocal fileformat=unix |
        \ setlocal textwidth=79 | 
]]

