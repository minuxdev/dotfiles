#!/bin/bash

# ==============================================================================
# COLOR & FORMATTING DEFINITIONS
# ==============================================================================
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# ==============================================================================
# INTERACTIVE FUNCTIONS (SPINNER)
# ==============================================================================

# Loading Spinner Function
# Usage: run_with_spinner "Message" command_to_run
run_with_spinner() {
  local msg="$1"
  shift

  # Run the command in the background, suppressing standard output
  "$@" >/dev/null 2>&1 &
  local pid=$!
  local spinner='|/-\'

  # Hide terminal cursor to make it look cleaner
  tput civvis 2>/dev/null

  while kill -0 $pid 2>/dev/null; do
    for i in $(seq 0 3); do
      # Prints the message and the spinner, returning the cursor to the start of the line (\r)
      printf "\r${YELLOW}:: %s...  ${CYAN}%s${NC}" "$msg" "${spinner:$i:1}"
      sleep 0.1
    done
  done

  # Restore terminal cursor
  tput cnorm 2>/dev/null

  # Check command exit status
  wait $pid
  if [ $? -eq 0 ]; then
    printf "\r${YELLOW}:: %s...  ${GREEN}Done!${NC}\n" "$msg"
  else
    printf "\r${YELLOW}:: %s...  ${RED}Failed!${NC}\n" "$msg"
  fi
}

# ==============================================================================
# HEADER DISPLAY
# ==============================================================================
clear
echo -e "${CYAN}${BOLD}"
echo "    ____        __    _______ __             "
echo "   / __ \____  / /_  / ____(_) /__  _____    "
echo "  / / / / __ \/ __/ / /_  / / / _ \/ ___/    "
echo " / /_/ / /_/ / /_  / __/ / / /  __(__  )     "
echo "/_____/\____/\__/ /_/   /_/_/\___/____/      "
echo -e "${NC}"
echo -e "${BLUE}====================================================${NC}"
echo -e "${GREEN}${BOLD}      DOTFILES BACKUP & SYNCHRONIZATION SCRIPT      ${NC}"
echo -e "${BLUE}====================================================${NC}"
echo -e "  Started on: $(date '+%Y-%m-%d %H:%M:%S')"
echo -e "${BLUE}----------------------------------------------------${NC}\n"

# ==============================================================================
# DIRECTORY PATHS
# ==============================================================================
CONFIG_DIR="$HOME/.config"
DOTS_DIR="$HOME/dots"
SERVER_DIR="$HOME/dotfiles"

DESK_ENV="$DOTS_DIR/desktop_environment"
TERMINAL="$DOTS_DIR/terminal"
TEXT_EDITORS="$DOTS_DIR/text_editors"

# ==============================================================================
# BACKUP PROCESS
# ==============================================================================

echo -e "${YELLOW}:: Pre-checking backup directory structure...${NC}"
mkdir -p "$DESK_ENV" "$TERMINAL" "$TEXT_EDITORS"

# 1. Desktop Environment
echo -e "\n${BLUE}[1/4] Processing DESKTOP ENVIRONMENT...${NC}"
for app in hypr rofi waybar; do
  if [ -d "$CONFIG_DIR/$app" ]; then
    # rsync -au copies only new or updated files, keeping existing folder content untouched
    run_with_spinner "Updating $app" rsync -au "$CONFIG_DIR/$app/" "$DESK_ENV/$app/"
  else
    echo -e "${RED}  ! Configuration for '$app' not found.${NC}"
  fi
done

# 2. Terminal
echo -e "\n${BLUE}[2/4] Processing TERMINAL...${NC}"
for app in foot zsh tmux; do
  if [ -d "$CONFIG_DIR/$app" ]; then
    run_with_spinner "Updating $app" rsync -au "$CONFIG_DIR/$app/" "$TERMINAL/$app/"
  else
    echo -e "${RED}  ! Configuration for '$app' not found.${NC}"
  fi
done

# 3. Text Editors
echo -e "\n${BLUE}[3/4] Processing TEXT EDITORS...${NC}"
if [ -d "$CONFIG_DIR/nvim" ]; then
  run_with_spinner "Updating nvim" rsync -au "$CONFIG_DIR/nvim/" "$TEXT_EDITORS/nvim/"

  # Safely remove the plugin folder if it exists in the local backup destination
  if [ -d "$TEXT_EDITORS/nvim/plugin" ]; then
    run_with_spinner "Cleaning up plugin directory from backup" rm -rf "$TEXT_EDITORS/nvim/plugin"
  fi
else
  echo -e "${RED}  ! Configuration for 'nvim' not found.${NC}"
fi

# 4. Updating the Server
echo -e "\n${BLUE}[4/4] UPDATING THE SERVER...${NC}"
if [ -d "$SERVER_DIR" ]; then
  echo -e "${YELLOW}  -> Incrementally updating server folder (no files will be deleted)...${NC}"

  # Removed --delete flag. Added -u (update) to prevent overwriting newer files on the server.
  rsync -au --info=progress2 "$DOTS_DIR/" "$SERVER_DIR/"
  echo -e "\n${GREEN}${BOLD}✔ Server synchronization complete!${NC}"

  # ==========================================================================
  # GIT AUTO-PUSH
  # ==========================================================================
  if [ -d "$SERVER_DIR/.git" ]; then
    echo -e "\n${BLUE}:: Git repository detected. Starting auto-push...${NC}"
    cd "$SERVER_DIR" || exit

    run_with_spinner "Git adding changes" git add .
    run_with_spinner "Git committing" git commit -m "auto-backup: $(date '+%Y-%m-%d %H:%M:%S')"
    run_with_spinner "Git pushing to remote" git push

    echo -e "${GREEN}${BOLD}✔ Git repository updated!${NC}"
  fi

else
  echo -e "\n${RED}${BOLD}✘ Error: Server folder not found or not mounted at $SERVER_DIR${NC}"
fi

echo -e "\n${GREEN}${BOLD}====================================================${NC}"
echo -e "${GREEN}${BOLD}             ALL TASKS COMPLETED SUCCESSFULLY        ${NC}"
echo -e "${GREEN}${BOLD}====================================================${NC}"
