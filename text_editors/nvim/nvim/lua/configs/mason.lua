local status, mason = pcall(require, "mason")
if not status then
	return
end

mason.setup({
	ui = {
		border = "rounded",
		width = 0.8,
		height = 0.6,
	},
})
