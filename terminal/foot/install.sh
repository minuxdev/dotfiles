#!/bin/bash

set -e

SCRIPT_DIR=$(dirname "$(realpath "$0")")
CONFIG_DIR="$HOME/.config"
FOOT_DIR="$CONFIG_DIR/foot"

# Install and configs terminal
mkdir -p "$FOOT_DIR"

sudo pacman -S foot --noconfirm --needed

cp -r "$SCRIPT_DIR"/. "$FOOT_DIR/"
cat >"$FOOT_DIR/foot.ini" <<'EOF'
# -*- conf -*-

[main]
include=~/.config/foot/themes/current_theme.ini

term=foot
font=iMWritingMono Nerd Font:size=12
line-height=14
EOF

if command -v zsh &>/dev/null; then
  echo "shell=zsh" >>"$FOOT_DIR/foot.ini"
else
  echo "shell=bash" >>"$FOOT_DIR/foot.ini"
fi
