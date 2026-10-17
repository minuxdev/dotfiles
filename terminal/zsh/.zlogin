
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  if command -v hyprctl &> /dev/null; then
    exec hyprland
  fi
fi
