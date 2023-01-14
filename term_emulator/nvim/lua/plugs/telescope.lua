local builtin = require("telescope.builtin")

local vks = vim.keymap.set

vks("n", "<Leader>p", builtin.find_files, {})
vks("n", "<Leader><Leader>", builtin.oldfiles, {})
vks("n", "<Leader>fg", builtin.live_grep, {})
vks("n", "<Leader>fh", builtin.help_tags, {})

