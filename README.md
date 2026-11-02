# ⚙️ System Environment & Dotfiles Configuration

A comprehensive documentation of dependencies, desktop environment components, file managers, terminal setups, text editors, and language tools.

---

### 🚀 Quick Start / Installation

This repository includes an automated bootstrapping script (`install.sh`) to configure the entire environment on a fresh Arch Linux system.

```bash
# 1. Clone the repository
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# 2. Make the installation script executable
find . -type f -name "*.sh" -exec chmod +x {} +

# 3. Run the installer
./install.sh
```

> ⚠️ **Note:** The `install.sh` script automates the setup process by checking out package toolkits, installing your package managers (`yay`), downloading system dependencies, configuring external tools, symlinking profiles to your `~/.config` directories, and pulling down your editor plugins. Review the script contents before executing.

---

## 📦 System Dependencies

### Core & System Package Management
* `yay` — AUR helper for Arch Linux packages.
* `nerd-fonts` — Icon-patched fonts required for terminal and bar visuals.
* `postgresql` — Object-relational database system.

### Command Line Utilities
* `atool` — Script for managing file archives of various formats.
* `bat` — A cat clone with syntax highlighting and Git integration.
* `bpytop` — Linux resource monitor that shows usage and stats.
* `exa` — A modern replacement for the `ls` command.
* `fd` — A simple, fast and user-friendly alternative to `find`.
* `figlet` — Program for making large letters out of ordinary text.
* `fzf` — A command-line fuzzy finder.
* `jq` — Lightweight and flexible command-line JSON processor.
* `lsd` — Modern file listing command with icons and colors.
* `man` — System reference manual interface.
* `most` — Paging program that supports window splitting and scrolling.
* `rsync` — Fast, versatile, remote and local file-copying tool.
* `ripgrep` — Fast line-oriented search tool that respects gitignore.
* `tldr` — Simplified, community-driven man pages.
* `trash-cli` — Command-line interface to the system trashcan.
* `tree` — Recursive directory listing program producing a depth-indented listing.
* `unrar` — Utility to extract, view, and test RAR archives.
* `unzip` — Utility to list, test, and extract compressed files from a ZIP archive.
* `zip` — Compression and file packaging utility.

### Media & Audio Stack
* `audacious` — Lightweight and versatile audio player.
* `firefox` — Extensible open-source web browser.
* `mpv` — Free, open-source, and cross-platform media player.
* `pavucontrol` — PulseAudio volume control panel.
* `pipewire` — Multimedia framework for handling audio and video pipelines.
* `pipewire-pulse` — PulseAudio emulation layer for PipeWire.
* `playerctl` — Command-line utility for controlling media players.
* `vlc` — Highly versatile multi-platform multimedia player.
* `wireplumber` — Modular session manager for PipeWire.
* `wl-clipboard` — Command-line copy/paste utilities for Wayland.

### Storage & Code Parsing
* `ntfsprogs` — Utilities for creating, fixing, and querying NTFS file systems.
* `tree-sitter` — Incremental parsing system for programming tools.
* `tree-sitter-cli` — Command-line tool for developing and testing Tree-sitter grammars.

---

## 🖥️ Desktop Environment

* `hyprland` — Dynamic tiling Wayland compositor that doesn't sacrifice on looks.
* `rofi` — Window switcher, application launcher, and dmenu replacement.
* `waybar-git` — Highly customizable Wayland bar for compositors like Hyprland.
* `dunst` (via `libnotify`) — Lightweight and customizable notification daemon.
* `ly` — TUI display manager for Linux and BSD.

---

## 📁 File Managers

* `ranger` — Console file manager with VI keybindings.
* `thunar` — Modern, fast, and easy-to-use graphical file manager (integrated with `gvfs` for virtual filesystem operations).

---

## 💻 Terminal Setup

### Shell & Plugins
* `zsh` — Advanced programmable command interpreter (shell).
  * `fast-syntax-highlighting` — Real-time syntax highlighting for the Zsh command line.
  * `fzf-tab` — Replaces zsh's default completion menu with an fzf-powered menu.
  * `zsh-autosuggestion` — Suggests commands based on your shell history as you type.
  * `zsh-history-substring-search` — Fish-like history search feature using entered substrings.
  * `zsh-vi-mode` — Vi-mode editing capability for the Zsh command line prompt.

### Terminal Emulators & Multiplexers
* `foot` — Fast, lightweight, and minimalistic Wayland-native terminal emulator.
* `tmux` — Terminal multiplexer workspace manager.
  * `catppuccin-theme` — Soothing pastel workspace theme for Tmux.

---

## 📝 Text Editors

* `nvim` — (Default) Vim-fork focused on extensibility and agility via Lua.
* `gedit` — (Fallback) Pluggable text editor targeted for the GNOME desktop.

---

## 🛠️ Installed LSPs & Formatters (Global)

* `bash-language-server` — LSP for Bash scripting.
* `yaml-language-server` — LSP for YAML files.
* `eslint-language-server` — LSP providing ESLint code validation.
* `typescript-language-server` — LSP providing support for JavaScript and TypeScript.
* `lua-language-server` — LSP providing code completion and diagnostics for Lua.
* `taplo` — TOML toolkit providing formatting and LSP diagnostic tools.
* `shfmt` — Shell script formatter, parser, and interpreter.
* `prettier` — Opinionated, cross-language code formatter.

---

## 🔌 Neovim Plugin Architecture

### LSP Support & UI
* `williamboman/mason.nvim` — Manages installations for LSPs, DAPs, linters, and formatters.
* `williamboman/mason-lspconfig.nvim` — Bridges `mason.nvim` with `nvim-lspconfig` for easier setup.
* `stevearc/conform.nvim` — A lightweight code formatter plugin for Neovim.
* `neovim/nvim-lspconfig` — Quick-start configurations for Neovim's built-in LSP client.
* `glepnir/lspsaga.nvim` — Provides a highly customizable UI for LSP elements like hovers, definitions, and finder windows.

### Fuzzy Finder & UI Elements
* `nvim-telescope/telescope.nvim` — A highly extendable fuzzy finder over lists (files, buffers, grep, etc.).
* `nvim-lua/plenary.nvim` — A collection of Lua modules utilized by many plugins (required by Telescope).
* `nvim-telescope/telescope-file-browser.nvim` — File browser extension for Telescope.
* `nvim-tree/nvim-web-devicons` — Fork of `vim-devicons` providing file type icons.
* `echasnovski/mini.icons` — Lightweight icon provider plugin.
* `nvim-lualine/lualine.nvim` — A fast and easy-to-configure statusline.

### Code Formatting & Highlighting
* `MunifTanjim/prettier.nvim` — Integration for Prettier formatting.
* `nvim-treesitter/nvim-treesitter` — Provides advanced syntax highlighting and structural code analysis.
* `pangloss/vim-javascript` — Improved JavaScript indentation and syntax support.
* `MaxMEllon/vim-jsx-pretty` — JSX syntax highlighting and beautification.

### Autocompletion & Snippets
* `hrsh7th/nvim-cmp` — An autocompletion engine framework.
* `hrsh7th/cmp-nvim-lsp` — Completion source using the built-in LSP client.
* `hrsh7th/cmp-buffer` — Completion source using words from current buffers.
* `hrsh7th/cmp-path` — Completion source using filesystem paths.
* `L3MON4D3/LuaSnip` — Powerful snippet engine written entirely in Lua.
* `mlaursen/vim-react-snippets` — Collection of React-specific snippets.
* `onsails/lspkind-nvim` — Adds VS Code-like pictograms to Neovim completion items.
* `saadparwaiz1/cmp_luasnip` — Integration source for `nvim-cmp` to read `LuaSnip` entries.
* `rafamadriz/friendly-snippets` — A vast collection of snippets for multiple programming languages.

### Code Editing & Navigation Enhancements
* `windwp/nvim-autopairs` — Automatically closes bracket and quote pairs.
* `windwp/nvim-ts-autotag` — Automatically closes and renames XML/HTML-like tags using treesitter.
* `JoosepAlviste/nvim-ts-context-commentstring` — Sets the `commentstring` contextually in mixed files (like JSX).
* `numToStr/Comment.nvim` — Fast and feature-rich comment toggling.
* `nvim-mini/mini.comment` — Clean and minimal text commenting utility.
* `tpope/vim-surround` — Easily delete, change, and add surrounding quotes/brackets.
* `nvim-pack/nvim-spectre` — Visual panel for project-wide search and replace using RegEx.
* `mg979/vim-visual-multi` — Enables multi-cursor editing in Neovim.
* `markstory/vim-zoomwin` — Toggles the zoom level of the active window pane.
* `folke/which-key.nvim` — Displays a popup overlay with available keybindings.
* `gelguy/wilder.nvim` — Enhances the command-line mode (`:`) with better autocomplete visuals.

### Aesthetics & Colorschemes
* `RRethy/nvim-base16` — A bundle of base16 color schemes.
* `norcalli/nvim-colorizer.lua` — A high-performance color highlighter displaying actual color previews under hex codes.
* `catppuccin/nvim` — The Catppuccin color scheme flavor palette.

### Language Support
* `ray-x/go.nvim` — A comprehensive Go development plugin environment.
