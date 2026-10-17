--      _         _          ____  _             _
--     / \  _   _| |_ ___   / ___|| |_ __ _ _ __| |_
--    / _ \| | | | __/ _ \  \___ \| __/ _` | '__| __|
--   / ___ \ |_| | || (_) |  ___) | || (_| | |  | |_
--  /_/   \_\__,_|\__\___/  |____/ \__\__,_|_|   \__|
--
-- ----------------------------------------------------------
--                   AUTO-START SCRIPTS                    --
-- ----------------------------------------------------------
--
local vars = require("configs/variables")
hl.on("hyprland.start", function()
  hl.exec_cmd(vars.terminal)
  hl.exec_cmd("waybar")
  hl.exec_cmd("awww-daemon &")
  hl.exec_cmd("~/.config/hypr/apps/dynamic-wall &")
end)
