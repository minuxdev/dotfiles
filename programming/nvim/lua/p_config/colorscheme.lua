vim.o.termguicolors = true

vim.cmd [[
  colorscheme base16-catppuccin
]]

vim.api.nvim_set_hl(0, "TelescopeBorder", { ctermbg = 122 })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { ctermbg = 122 })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { ctermbg = 352, ctermfg = 122 })

local c_status, colorizer = pcall(require, 'colorizer')
if not c_status then return end
colorizer.setup(
  {},
  { mode = 'background' }
)
