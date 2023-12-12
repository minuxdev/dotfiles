require("lualine").setup({
	options = {
		icons_enable = true,
		theme = "pywal-nvim",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		--section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { right = "" }, right_padding = 2 },
		},
		lualine_b = { "filename", "branch" },
		lualine_c = { "fileformat" },

		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{ "location", separator = { left = "" }, left_padding = 2 },
		},
	},
	tabline = {
		lualine_a = { "buffers" },
		lualine_b = { "branch", "diff", "diagnostic" },
		lualine_c = {},
		lualine_x = { "encoding" },
		lualine_y = {},
		lualine_z = { "tabs" },
	},
	disabled_filetypes = {
		statusline = {},
		winbar = {},
	},
	ignore_focus = {},
	always_divide_middle = true,
	globalstatus = false,
	extensions = {},
	winbar = {},
	refresh = {
		statusline = 1000,
		tabline = 1000,
		winbar = 1000,
	},
})
