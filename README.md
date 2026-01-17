# three-dotfiles

Window management and terminal configs for macOS. Works with HHKB, MacBook keyboard, or HHKB connected to MacBook.

## What's Included

| Config | Purpose |
|--------|---------|
| `skhd/skhdrc` | Hotkey daemon - window management keybindings |
| `yabai/yabairc` | Tiling window manager config |
| `karabiner/karabiner.json` | Keyboard remapping (hyper key, caps→cmd, terminal ctrl/cmd swap) |
| `alacritty/alacritty.toml` | Terminal emulator config (opacity, font, padding) |

## Related Repos

- **nvim config**: [three-nvim](https://github.com/dick-jo/three-nvim) (managed separately)

## Keybinding Reference

Hyper key = `right_command` (right side of spacebar)

| Action | Keys |
|--------|------|
| Focus window | `hyper + h/j/k/l` |
| Focus display | `hyper + u/i` |
| Swap mode | `hyper + s` → then `h/j/k/l` |
| Warp mode | `hyper + w` → then `h/j/k/l` |
| Exit mode | `escape` |
| Rotate layout | `hyper + r` |
| Toggle float | `hyper + n` |
| Fullscreen | `hyper + m` |
| Rebalance | `hyper + e` |

---

## Claude Code Instructions

### Fresh Install (New Machine)

```
Clone this repo to ~/three-dotfiles and run the install script:

git clone https://github.com/dick-jo/three-dotfiles.git ~/three-dotfiles
cd ~/three-dotfiles && ./install.sh

Then clone nvim config:

git clone https://github.com/dick-jo/three-nvim.git ~/.config/nvim
```

### Pull Latest and Apply

```
cd ~/three-dotfiles && git pull
./install.sh
```

### After Making Local Config Changes

If configs were edited directly in ~/.config (not via the symlinked repo):

```
cd ~/three-dotfiles
cp ~/.config/skhd/skhdrc skhd/skhdrc
cp ~/.config/yabai/yabairc yabai/yabairc
cp ~/.config/karabiner/karabiner.json karabiner/karabiner.json
cp ~/.config/alacritty/alacritty.toml alacritty/alacritty.toml
git add -A && git commit -m "Update configs" && git push
```

Note: After install.sh runs, configs are symlinked, so edits to ~/.config/* automatically edit the repo files.

### Sync nvim Config

```
cd ~/.config/nvim && git pull
```

Or to push nvim changes:

```
cd ~/.config/nvim && git add -A && git commit -m "Update nvim config" && git push
```

---

## Prerequisites

Install via Homebrew:

```bash
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install --cask karabiner-elements
brew install --cask alacritty
```

Start services:

```bash
yabai --start-service
skhd --start-service
```

Note: yabai requires accessibility permissions and may need SIP partially disabled for full functionality. See [yabai wiki](https://github.com/koekeishiya/yabai/wiki).
