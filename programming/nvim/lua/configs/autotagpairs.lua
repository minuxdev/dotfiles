local ts, tag = pcall(require, "nvim-ts-autotag")
local ps, pairs = pcall(require, "nvim-autopairs")

if not ts then
	return
end
if not ps then
	return
end


tag.setup({})
pairs.setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})
