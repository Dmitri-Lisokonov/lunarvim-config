#!/usr/bin/env bash
set -euo pipefail

# Update the LunarVim config from the CURRENT repository (no installs, no cloning)

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
SRC="$REPO_ROOT"
DEST="$HOME/.config/lvim"

mkdir -p "$DEST"

rsync -av --delete \
  --exclude=".git" \
  --exclude=".gitmodules" \
  --exclude=".gitignore" \
  --exclude=".gitattributes" \
  --exclude="README*" \
  --exclude="LICENSE*" \
  "$SRC"/ "$DEST"/

echo "LunarVim config updated from: $SRC -> $DEST"
