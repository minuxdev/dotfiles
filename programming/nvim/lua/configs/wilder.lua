local s, wilder = pcall(require, "wilder")

if not s then
	return
end

wilder.setup({
	modes = { ":", "/", "?" },
	accept_key = "<Right>",
	reject_key = "<Left>",
})

wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
		border = "rounded",
		max_height = "40%",
		min_height = 0,
		prompt_positioin = "top",
		reverse = 0,
	}))
)
