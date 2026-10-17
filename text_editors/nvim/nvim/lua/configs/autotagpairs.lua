local ts, tag = pcall(require, "nvim-ts-autotag")
local ps, npairs = pcall(require, "nvim-autopairs")

if not ts then
  return
end
if not ps then
  return
end

tag.setup({})
npairs.setup({
  -- check_ts = true,
  disable_filetype = { "TelescopePrompt", "vim" },
  fast_wrap = {
    map = "M-e",
    chars = { "{", "[", "'", '"' },
  },
})
