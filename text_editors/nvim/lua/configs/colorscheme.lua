local _, cat = pcall(require, "catppuccin")

if not _ then
  print("Not loaded")
  return
end

cat.setup({
  flavour = "mocha",
  integrations = {
    treesitter = true,
    which_key = true,
    telescope = {
      enabled = true,
      style = "nvchad"
    }
  }
})

vim.opt.termguicolors = true
vim.cmd("colorscheme catppuccin")
--
-- vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
-- vim.api.nvim_set_hl(0, "WichKeyFloat", { bg = "#333333" })
