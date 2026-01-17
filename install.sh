#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR"

# Create config directories if they don't exist
mkdir -p ~/.config/skhd
mkdir -p ~/.config/yabai
mkdir -p ~/.config/karabiner
mkdir -p ~/.config/alacritty/themes

# Backup existing configs (if they exist and aren't symlinks)
backup_if_exists() {
    if [ -f "$1" ] && [ ! -L "$1" ]; then
        echo "Backing up $1 to $1.backup"
        mv "$1" "$1.backup"
    fi
}

backup_if_exists ~/.config/skhd/skhdrc
backup_if_exists ~/.config/yabai/yabairc
backup_if_exists ~/.config/karabiner/karabiner.json
backup_if_exists ~/.config/alacritty/alacritty.toml
backup_if_exists ~/.config/alacritty/themes/everforest_dark.toml

# Create symlinks
ln -sf "$DOTFILES_DIR/skhd/skhdrc" ~/.config/skhd/skhdrc
ln -sf "$DOTFILES_DIR/yabai/yabairc" ~/.config/yabai/yabairc
ln -sf "$DOTFILES_DIR/karabiner/karabiner.json" ~/.config/karabiner/karabiner.json
ln -sf "$DOTFILES_DIR/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
ln -sf "$DOTFILES_DIR/alacritty/themes/everforest_dark.toml" ~/.config/alacritty/themes/everforest_dark.toml

echo "Symlinks created:"
echo "  ~/.config/skhd/skhdrc -> $DOTFILES_DIR/skhd/skhdrc"
echo "  ~/.config/yabai/yabairc -> $DOTFILES_DIR/yabai/yabairc"
echo "  ~/.config/karabiner/karabiner.json -> $DOTFILES_DIR/karabiner/karabiner.json"
echo "  ~/.config/alacritty/alacritty.toml -> $DOTFILES_DIR/alacritty/alacritty.toml"
echo "  ~/.config/alacritty/themes/everforest_dark.toml -> $DOTFILES_DIR/alacritty/themes/everforest_dark.toml"

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
echo "Done! Karabiner should auto-reload. You may need to restart alacritty."
