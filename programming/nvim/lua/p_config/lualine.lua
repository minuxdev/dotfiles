require("lualine").setup {
  options = {
    icons_enable = true,
    theme = "base16",
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },

    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  }
}




--vim.cmd [[
--  function! TablineHighlight()
--    highlight TabLineSel guibg=#2E3440 guifg=#81A1C1
--    highlight TabLine guibg=#3B4252 guifg=#ECEFF4
--  endfunction
--
--  call TablineHighlight()
--
--  autocmd ColorScheme * call TablineHighlight()
--]]
