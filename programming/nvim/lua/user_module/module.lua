local M = {}


-- Keymaps
function M.map(mode, key, command)
  vim.keymap.set(mode, key, command, { noremap = true, silent = true })
end

local function terminal_window(cmd)

  -- Percentage of terminal window based on the current window height
  local win_percentage = 0.4
  -- Get current window height
  local win_height = vim.api.nvim_win_get_height(0)

  -- Calculate terminal percentage
  local term_heght = math.floor(win_percentage * win_height)

  -- Louch terminal window
  vim.cmd(":below " .. term_heght .. " split | term")

  -- -- Press keys to open terminal
  vim.api.nvim_feedkeys(cmd, 't', false)
end

-- Open terminal
function M.open_terminal(cmd)

  -- Get terminal codes. The `i` means `insert mode`
  if not cmd then
    cmd = vim.api.nvim_replace_termcodes("i", true, false, false)
  end
  terminal_window(cmd)
end

-- Open terminal and run current file
function M.open_and_run(cmd)
  -- Get file name in current buffer
  local file_name = vim.api.nvim_buf_get_name(0)

  -- Get terminal codes. The `i` means `insert mode`
  if not cmd then
    cmd = vim.api.nvim_replace_termcodes("ipython " .. file_name , true, false, false)
  end
  terminal_window(cmd)
end

return M
