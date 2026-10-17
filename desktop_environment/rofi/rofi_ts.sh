#!/bin/sh

ROFI_DIR=~/.config/rofi
THEMES="$ROFI_DIR/themes"

# List available themes and get selected
selected_theme=$(ls -1 "$THEMES" | rofi -show -dmenu -theme "$ROFI_DIR/default.rasi")

# Apply theme
if [ ! -z $selected_theme ]; then
  # Apply selected theme
  cat $THEMES/$selected_theme > "$ROFI_DIR/default.rasi"
else 
  printf "No theme was selected."
fi
