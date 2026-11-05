if [[ -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" && "$TTY" = "/dev/tty1" ]]; then
  if command -v hyprctl &>/dev/null; then
    exec start-hyprland
  fi
fi
