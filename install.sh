#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR"

# Backup helper - handles both files and directories
backup_if_exists() {
    if [ -e "$1" ] && [ ! -L "$1" ]; then
        echo "Backing up $1 to $1.backup"
        mv "$1" "$1.backup"
    elif [ -L "$1" ]; then
        rm "$1"  # Remove existing symlink
    fi
}

# --- skhd (directory symlink) ---
backup_if_exists ~/.config/skhd
ln -sfn "$DOTFILES_DIR/skhd" ~/.config/skhd

# --- yabai (directory symlink) ---
backup_if_exists ~/.config/yabai
ln -sfn "$DOTFILES_DIR/yabai" ~/.config/yabai

# --- alacritty (directory symlink) ---
backup_if_exists ~/.config/alacritty
ln -sfn "$DOTFILES_DIR/alacritty" ~/.config/alacritty

# --- karabiner (file symlink - preserve karabiner's own directories) ---
mkdir -p ~/.config/karabiner
backup_if_exists ~/.config/karabiner/karabiner.json
ln -sf "$DOTFILES_DIR/karabiner/karabiner.json" ~/.config/karabiner/karabiner.json

# --- nvim (directory symlink) ---
backup_if_exists ~/.config/nvim
ln -sfn "$DOTFILES_DIR/nvim" ~/.config/nvim

echo "Symlinks created:"
echo "  ~/.config/skhd -> $DOTFILES_DIR/skhd"
echo "  ~/.config/yabai -> $DOTFILES_DIR/yabai"
echo "  ~/.config/alacritty -> $DOTFILES_DIR/alacritty"
echo "  ~/.config/karabiner/karabiner.json -> $DOTFILES_DIR/karabiner/karabiner.json"
echo "  ~/.config/nvim -> $DOTFILES_DIR/nvim"

# Restart services
echo ""
echo "Restarting services..."

if command -v skhd &> /dev/null; then
    skhd --restart-service 2>/dev/null || brew services restart skhd 2>/dev/null || echo "Note: skhd not running"
fi

if command -v yabai &> /dev/null; then
    yabai --restart-service 2>/dev/null || brew services restart yabai 2>/dev/null || echo "Note: yabai not running"
fi

echo ""
echo "Done! Karabiner should auto-reload. You may need to restart alacritty and nvim."
