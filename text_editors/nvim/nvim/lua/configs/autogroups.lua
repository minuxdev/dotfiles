-- Highlight yanked
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 400 })
	end,
})

-- Python specific sets
local filetype = vim.bo.filetype
if filetype == "python" then
	vim.cmd([[
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
  ]])
end
