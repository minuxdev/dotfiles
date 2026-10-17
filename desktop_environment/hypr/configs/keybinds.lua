--   _  __                ____  _           _
--  | |/ /___ _   _      | __ )(_)_ __   __| (_)_ __   __ _ ___
--  | ' // _ \ | | |_____|  _ \| | '_ \ / _` | | '_ \ / _` / __|
--  | . \  __/ |_| |_____| |_) | | | | | (_| | | | | | (_| \__ \
--  |_|\_\___|\__, |     |____/|_|_| |_|\__,_|_|_| |_|\__, |___/
--            |___/                                   |___/
-- --------------------- HYPRLAND CONTROL -------------------------
--
-- --------------------- WORKSPACES MANAGEMENT -------------------------
local mainMod = "SUPER"
--  Switch workspaces with mainMod + [0-9]
--  Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10   -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end


--  Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + period", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + comma", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + CONTROL + period", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + CONTROL + comma", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mainMod .. " + f", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + p", function()
  hl.dsp.window.float({ action = "toggle" })
end)


-- --------------------- WINDOW MANAGEMENT -------------------------
--  Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.drag(), { mouse = true })

--  Move focus
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + BACKSPACE", hl.dsp.window.close())

-- Multimedia keys for volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
