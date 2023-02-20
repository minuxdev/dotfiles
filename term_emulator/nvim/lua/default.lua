
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
set.swapfile = false

vim.cmd[[ 
  let g:jedi#force_py_version = 3
]]

vim.cmd[[
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
    \ setlocal columns=80 |
]]
