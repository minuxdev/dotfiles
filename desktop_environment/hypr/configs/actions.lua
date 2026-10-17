--      _        _   _
--     / \   ___| |_(_) ___  _ __  ___
--    / _ \ / __| __| |/ _ \| '_ \/ __|
--   / ___ \ (__| |_| | (_) | | | \__ \
--  /_/   \_\___|\__|_|\___/|_| |_|___/
-- ----------------------------------------------------------
--                   Actions bindings                      --
-- ----------------------------------------------------------
--

local vars = require("configs/variables")

hl.bind("SUPER + w", hl.dsp.exec_cmd(vars.wallpaper))
hl.bind("SUPER + d", hl.dsp.exec_cmd(vars.dynamic_wallpaper))
hl.bind("SUPER + t", hl.dsp.exec_cmd(vars.file_manager))
hl.bind("SUPER + e", hl.dsp.exec_cmd(vars.term_file_manager))
hl.bind("SUPER + m", hl.dsp.exec_cmd(vars.window_switcher))
hl.bind("SUPER + s", hl.dsp.exec_cmd(vars.smb))
hl.bind("SUPER + b", hl.dsp.exec_cmd(vars.web))
-- hl.bind("Print", hl.dsp.exec_cmd(vars.screenshot))
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(vars.terminal))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(vars.rofi))
--
---- ----------------------------------------------------------
----                   HYPRCTL CONTROLS                      --
---- ----------------------------------------------------------
hl.bind("CONTROL + ALT + BACKSPACE", hl.dsp.exit())
hl.bind("CONTROL + ALT + r", hl.dsp.exec_cmd("hyprctl reload"))
---- hl.bind("CONTROL", "ALT", "t", hl.dsp.exec_cmd())
--
