#!/bin/bash

set -euo pipefail

SCRIPT_DIR=$(dirname "$(realpath "$0")")
CONFIG_DIR="$HOME/.config"
ZSH_DIR="$CONFIG_DIR/zsh"

echo -e "\n:: Installing Zsh.."
sudo pacman -S zsh --noconfirm --needed

if command -v zsh &>/dev/null; then
  # Remove background color when listing directories
  dircolors -p | sed 's/;42/;01/' >~/.dircolors

  [ -d "$ZSH_DIR" ] && mv "$ZSH_DIR" "$ZSH_DIR"$(date +%N).bkp

  # Place zsh files in place
  printf "\n:: Setting up zsh...\n"
  [ -d "$SCRIPT_DIR" ] && cp -rvf "$SCRIPT_DIR" "$CONFIG_DIR"
  [ -d "$ZSH_DIR" ] && {
    cp "$ZSH_DIR/.zshenv" ~/.zshenv &&
      ln -sf -T "$ZSH_DIR/.zshrc" ~/.zshrc
    ln -sf -T "$ZSH_DIR/.zlogin" ~/.zlogin
  }
  [ -L ~/.zshrc ] && /usr/bin/zsh -i -c "source $HOME/.zshrc"

  sudo chsh -s /bin/zsh $USER

  echo ":: ZSH was successfully installed!"
else
  echo ":: ZSH failed to install on your system."
fi

#------------------------------------------------#
#              GIT CONFIGURATION                 #
#------------------------------------------------#

if ! command -v git &>/dev/null; then
  sudo pacman -S git --noconfirm
fi
# Init ssh
printf "\n\n:: GIT CONFIGURATION"
printf "\n:: Generate ssh key"
ssh-keygen -t ed25519 -C "minux.midi@gmail.com" -f ~/.ssh/id_ed25519 -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
printf "\nSSH Key generated. Update git account ssh key."

git config --global init.defaultBranch 'main'
git config --global user.name 'minuxdev'
git config --global user.email 'minux.midi@gmail.com'

#------------------------------------------------#
#                 NODE + NVM                     #
#------------------------------------------------#

echo -e "Step [2/2]: Installing NVM..."
if ! command -v curl &>/dev/null; then
  sudo pacman -S curl --needed --noconfirm
fi

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

if [ -f "$ZSH_DIR/configs/zsh-exports" ]; then
  if ! grep -q "NVM_DIR" "$ZSH_DIR/configs/zsh-exports"; then
    cat <<'EOF' >>"$ZSH_DIR/configs/zsh-exports"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
EOF
  fi

  # Use interactive shell sequence cleanly to boot up Node packages via NVM
  echo -e ":: Initializing NVM and installing Node ecosystem packages...\n"
  /usr/bin/zsh -i <<'EOF'
source $HOME/.zshrc
nvm install node
npm install -g npm semver@7 prettier
EOF

  printf ":: NVM, Node, and Prettier installed successfully!"
else
  echo "zsh-exports not found. NVM could not be added to PATH."
fi
