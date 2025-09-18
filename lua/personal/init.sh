#!/usr/bin/env bash
set -euo pipefail

# 1. Install prerequisites via Homebrew
brew update
brew install neovim git make python node rust ripgrep fd fzf lazygit rsync

# 2. Install LunarVim (nightly build) non-interactively
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y

# 3. Apply your custom configuration
rm -rf /tmp/lunarvim-config
git clone https://github.com/Dmitri-Lisokonov/lunarvim-config.git /tmp/lunarvim-config
mkdir -p "$HOME/.config/lvim"
rsync -a --exclude=".git" /tmp/lunarvim-config/ "$HOME/.config/lvim/"

echo "LunarVim installed with dependencies and your configuration applied."
