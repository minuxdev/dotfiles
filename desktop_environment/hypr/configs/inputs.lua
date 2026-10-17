-- ------------------------------- INPUTS -------------------------------
--monitor=DP-1, prefered, 1680x0, 1
----  monitor=HDMI-A-2, prefered, 0x0, 1
--
--
hl.monitor({
  output = "DP-1",
  position = "0x0",
  scale = 1,
  disabled = false
})

hl.monitor({
  output = "HDMI-A-2",
  position = "0x0",
  scale = 1,
  disabled = true
})


hl.config({
  input = {
    kb_layout = "us",
    numlock_by_default = true,
    follow_mouse = 1,
    sensitivity = 0, --  -1.0 - 1.0, 0 means no modification

    touchpad = {
      natural_scroll = false,
    },

  }
})
