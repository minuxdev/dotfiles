#!/bin/bash

# _____                   _             _
#|_   _|__ _ __ _ __ ___ (_)_ __   __ _| |
#  | |/ _ \ '__| '_ ` _ \| | '_ \ / _` | |
#  | |  __/ |  | | | | | | | | | | (_| | |
#  |_|\___|_|  |_| |_| |_|_|_| |_|\__,_|_|
#==================================================

echo ""
echo "SHELL: zsh | TERMINAL EMULATOR: foot | TERMINAL MULTIPLEXER: tmux"

BASE_DIR=$(dirname "$(realpath "$0") ")

echo ":: Installing shell"
"$BASE_DIR/zsh/install.sh"

echo ":: Install terminal"
"$BASE_DIR/foot/install.sh"

echo ":: Install tmux"
"$BASE_DIR/tmux/install.sh"
