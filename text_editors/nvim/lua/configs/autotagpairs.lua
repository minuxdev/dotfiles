local ts, tag = pcall(require, "nvim-ts-autotag")
local ps, npairs = pcall(require, "nvim-autopairs")

if not ts then
  print("ts-autotag: Plugin not found!")
  return
end
if not ps then
  print("autopairs: Plugin not found!")
  return
end


npairs.setup({
  check_ts = true,
  disable_filetype = { "TelescopePrompt", "vim" },
  fast_wrap = {
    map = "M-e",
    chars = { "{", "[", "'", '"', "<", "(" },
  },
})

tag.setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false
  },
  filetypes = {
    "html", "javascriptreact", "typescriptreact"
  }
})
