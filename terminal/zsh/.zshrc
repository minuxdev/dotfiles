# Source custom zsh functions
source "$ZDOTDIR/configs/zsh-functions"

zsh_add_file "configs/zsh-exports"                # source zsh-exports
zsh_add_file "configs/zsh-options"                # source zsh-options
zsh_add_file "configs/zsh-aliases"                # source aliases
zsh_add_theme "default"                           # load theme
zsh_install_plugin "fzf-tab"                      # to use fzf in searchs
zsh_install_plugin "fast-syntax-highlighting"     # for sintax hightlighting
zsh_install_plugin "zsh-autosuggestions"          # for autocompletion based in history file
zsh_install_plugin "zsh-history-substring-search" # for history search
zsh_install_plugin "zsh-vi-mode"                  # for vim motions

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

DISABLE_AUTO_TITLE="true"
