-- Telescope
--
local telescope = {
	builtin = function()
		return require("telescope.builtin")
	end,
	actions = function()
		return require("telescope.actions")
	end,
}

return {
	telescope = telescope,
	spectre = function()
		return require("spectre")
	end,
}
