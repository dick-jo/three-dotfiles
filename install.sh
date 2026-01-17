#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR"

# Create config directories if they don't exist
mkdir -p ~/.config

# Backup existing configs (if they exist and aren't symlinks)
backup_if_exists() {
    if [ -e "$1" ] && [ ! -L "$1" ]; then
        echo "Backing up $1 to $1.backup"
        mv "$1" "$1.backup"
    fi
}

backup_if_exists ~/.config/skhd
backup_if_exists ~/.config/yabai
backup_if_exists ~/.config/karabiner
backup_if_exists ~/.config/alacritty
backup_if_exists ~/.config/nvim

# Create symlinks (link entire directories)
ln -sfn "$DOTFILES_DIR/skhd" ~/.config/skhd
ln -sfn "$DOTFILES_DIR/yabai" ~/.config/yabai
ln -sfn "$DOTFILES_DIR/karabiner" ~/.config/karabiner
ln -sfn "$DOTFILES_DIR/alacritty" ~/.config/alacritty
ln -sfn "$DOTFILES_DIR/nvim" ~/.config/nvim

echo "Symlinks created:"
echo "  ~/.config/skhd -> $DOTFILES_DIR/skhd"
echo "  ~/.config/yabai -> $DOTFILES_DIR/yabai"
echo "  ~/.config/karabiner -> $DOTFILES_DIR/karabiner"
echo "  ~/.config/alacritty -> $DOTFILES_DIR/alacritty"
echo "  ~/.config/nvim -> $DOTFILES_DIR/nvim"

# Restart services
echo ""
echo "Restarting services..."

if command -v skhd &> /dev/null; then
    skhd --restart-service 2>/dev/null || brew services restart skhd 2>/dev/null || echo "Note: skhd not running or not installed via brew"
fi

if command -v yabai &> /dev/null; then
    yabai --restart-service 2>/dev/null || brew services restart yabai 2>/dev/null || echo "Note: yabai not running or not installed via brew"
fi

echo ""
echo "Done! Karabiner should auto-reload. You may need to restart alacritty and nvim."
