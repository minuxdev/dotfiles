--  __     __         _       _     _
--  \ \   / /_ _ _ __(_) __ _| |__ | | ___  ___
--   \ \ / / _` | '__| |/ _` | '_ \| |/ _ \/ __|
--    \ V / (_| | |  | | (_| | |_) | |  __/\__ \
--     \_/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/
-- ----------------------------------------------------------
--                   CUSTOM VARIABLES                      --
-- ----------------------------------------------------------

local V = {}

V.terminal = "foot"
V.rofi = "rofi -show drun -theme ~/.config/rofi/default.rasi"
V.term_file_manager = V.terminal .. " -e ranger"
V.web = "firefox"
V.file_manager = "thunar"
V.wallpaper = "~/.config/hypr/apps/wallpaper"
V.dynamic_wallpaper = "~/.config/hypr/apps/dynamic-wall 240"
V.smb = V.terminal .. " -e sh -c ~/.config/hypr/apps/mount-shares"
V.window_switcher = "~/.config/hypr/apps/window-switcher"

return V
