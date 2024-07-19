local status, saga = pcall(require, "lspsaga")
if not status then
	print("Lspsaga not installed!")
	return
end

saga.setup({
	finder = {
		max_height = 0.6,
		keys = {
			vsplit = "v",
		},
	},
	diagnostic = {
		max_height = 0.8,
		keys = {
			quit = { "q", "<esc>" },
		},
	},
	lightbulb = {
		enable = false,
	},
	virtual_text = false,
	layout = "float",
})
