#!/usr/bin/env bash
set -euo pipefail

# 1. Install prerequisites via Homebrew
# These tools are required by LunarVim: Neovim, git, make, Python/pip, node/npm, Rust/cargo, ripgrep:contentReference[oaicite:1]{index=1}.
# Additional tools (fd, fzf, lazygit) enhance Telescope and git integration.
brew update
brew install neovim git make python node rust ripgrep fd fzf lazygit

# 2. Install LunarVim (nightly build)
# Fetches and runs the official install script from GitHub.
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# 3. Apply your custom configuration
# Clone the repo and copy its contents into ~/.config/lvim.
rm -rf /tmp/lunarvim-config
git clone https://github.com/Dmitri-Lisokonov/lunarvim-config.git /tmp/lunarvim-config
mkdir -p "$HOME/.config/lvim"
rsync -a --exclude=".git" /tmp/lunarvim-config/ "$HOME/.config/lvim/"

echo "LunarVim installed with dependencies and your configuration applied."
