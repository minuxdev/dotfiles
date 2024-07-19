local status, telescope = pcall(require, "telescope")
if not status then
	return
end

telescope.load_extension("file_browser")

local actions = require("telescope.actions")
local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
	defaults = {
		layout_config = {
			height = 0.8,
			width = 0.8,
			prompt_position = "top",
		},
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		file_browser = {
			hijack_netrw = true,
			layout_config = {
				prompt_position = "bottom",
			},
			mappings = {
				["n"] = {
					["a"] = fb_actions.create,
					["c"] = fb_actions.copy,
					["m"] = fb_actions.move,
					["d"] = fb_actions.remove,
					["r"] = fb_actions.rename,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
	},
})

local function file_browser()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = vim.fn.expand("%:p:h"),
		respect_gitignore = false,
		hidden = true,
		grouped = false,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end

return file_browser
