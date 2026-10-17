#!/bin/bash
set -euo pipefail

#  ____                            _                 _
# |  _ \  ___ _ __   ___ _ __   __| | ___ _ __   ___(_) ___  ___
# | | | |/ _ \ '_ \ / _ \ '_ \ / _` |/ _ \ '_ \ / __| |/ _ \/ __|
# | |_| |  __/ |_) |  __/ | | | (_| |  __/ | | | (__| |  __/\__ \
# |____/ \___| .__/ \___|_| |_|\__,_|\___|_| |_|\___|_|\___||___/
#            |_|
#==============================================================


SCRIPT_DIR=$(dirname "$(realpath "$0") ")



#------------------------------------------------#
#             HELPERS MANAGER                    #
#------------------------------------------------#
_yay() {
  if ! command -v yay &>/dev/null; then
    echo -e "\n:: Installing YAY...\n"
    local YAY_DIR="$HOME/.git-clones"
    [ ! -d "$YAY_DIR" ] && mkdir -p "$YAY_DIR"
    cd "$YAY_DIR" &&
      [ ! -f "/usr/bin/git" ] && sudo pacman -Sy git --noconfirm
    git clone https://aur.archlinux.org/yay-git.git &&
      cd "yay-git" &&
        echo -e "\n\n# Set the number of parallel jobs for make to 5.\nMAKEFLAGS='-j5'" | sudo tee -a /etc/makepkg.conf &> /dev/null
      makepkg -si
  fi
}


_fonts() {
echo -e "\n:: Defining console font family...\n"
	sudo pacman -S fontconfig --needed --noconfirm
	FONTS_DIR="$HOME/.fonts/"
	[ ! -d "$FONTS_DIR" ] && mkdir -p "$FONTS_DIR"
	cp -rv "$SCRIPT_DIR/fonts/"* "$FONTS_DIR"
  fc-cache -fv
}


#------------------------------------------------#
#                OTHER TOOLS                     #
#------------------------------------------------#
_others() {
echo -e "\n:: Installing other utilities...\n"
  sudo pacman -S \
    fzf man most  rsync tree unrar ripgrep figlet trash-cli atool \
    zip bat exa unzip lsd jq tldr bpytop firefox vlc audacious wl-clipboard tldr \
    pipewire wireplumber pipewire-pulse pavucontrol mpv \
    playerctl ntfsprogs fd tree-sitter tree-sitter-cli --noconfirm --needed


  systemctl --user daemon-reload
  systemctl --user enable --now pipewire wireplumber pipewire-pulse

}


_postgresql() {
  # --- CONFIGURATION ---
  DB_USER="minuxdev"
  DB_PASS="minuxdev"
  DB_NAME="api"
  PG_DATA="/var/lib/postgres/data"

  echo ":: [1/5] Installing PostgreSQL..."
  sudo pacman -Syu --noconfirm postgresql

  echo ":: [2/5] Initializing the database cluster..."
  if [ ! -d "$PG_DATA/base" ]; then
      sudo -u postgres initdb -D "$PG_DATA" --locale=C.UTF-8
  else
      echo "-> Directory $PG_DATA is already initialized."
  fi

  echo ":: [3/5] Starting and enabling the PostgreSQL service..."
  sudo systemctl daemon-reload
  sudo systemctl enable --now postgresql

  echo ":: [4/5] Waiting for PostgreSQL to spin up..."
  sleep 3

  echo ":: [5/5] Creating Superuser and Database..."

  # 1. Create the superuser with the defined password 
  sudo -u postgres createuser -s -i -d -r -l -w $DB_USER 
  sudo -u postgres psql -c "ALTER ROLE $DB_USER WITH PASSWORD '$DB_PASS';"

  # 2. Create the 'api' database and assign ownership to the new user if it doesn't exist
  if [ $? -ne 0 ]; then
      sudo -u postgres psql -c "CREATE DATABASE $DB_NAME OWNER $DB_USER;"
      sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER"
      echo "-> Database '$DB_NAME' created successfully!"
  else
      echo "-> Database '$DB_NAME' already exists."
  fi

  echo -e "\n=================================================="
  echo "      INSTALLATION & CONFIGURATION COMPLETE!"
  echo "=================================================="
  echo "User:     $DB_USER"
  echo "Password: $DB_PASS"
  echo "Database: $DB_NAME"
  echo "=================================================="

}
_yay
_others
_fonts
_postgresql
