local status, telescope = pcall(require, "telescope")
if not status then return end

local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.setup({
  mappings = {
    i = {
      ['<esc>'] = actions.close,
    }
  },
  defaults = {
    layout_config = {
      height = 0.8,
      width = 0.9,
      prompt_position = 'top',
    },
  },
})


local map = vim.keymap.set

map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fo", builtin.oldfiles, {})
map("n", "<leader>fl", builtin.live_grep, {})
map("n", "<leader>fk", builtin.keymaps, {})
map("n", "<leader>fh", builtin.help_tags, {})
