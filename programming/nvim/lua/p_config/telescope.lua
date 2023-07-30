local builtin = require("telescope.builtin")

local map = vim.keymap.set

map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>of", builtin.oldfiles, {})
map("n", "<leader>lg", builtin.live_grep, {})
map("n", "<leader>fb", builtin.buffers, {})
map("n", "<leader>fh", builtin.help_tags, {})
