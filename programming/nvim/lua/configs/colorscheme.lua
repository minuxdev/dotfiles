vim.opt.termguicolors = true

vim.cmd("colorscheme base16-catppuccin-mocha")
--
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "WichKeyFloat", { bg = "#333333" })
--vim.api.nvim_set_hl(0, "TelescopeBorder", { ctermbg = 122 })
--vim.api.nvim_set_hl(0, "TelescopePromptBorder", { ctermbg = 122 })
--vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { ctermbg = 352, ctermfg = 122 })
