# three-dotfiles

Window management, terminal, and nvim configs for macOS. Works with HHKB, MacBook keyboard, or HHKB connected to MacBook.

## What's Included

| Config | Purpose |
|--------|---------|
| `skhd/` | Hotkey daemon - window management keybindings |
| `yabai/` | Tiling window manager config |
| `karabiner/` | Keyboard remapping (hyper key, caps→cmd, terminal ctrl/cmd swap) |
| `alacritty/` | Terminal emulator config (opacity, font, padding) |
| `nvim/` | Neovim config (nvchad-based, custom plugins, LSPs) |

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
git clone https://github.com/dick-jo/three-dotfiles.git ~/three-dotfiles
cd ~/three-dotfiles && ./install.sh
```

### Pull Latest and Apply

```
cd ~/three-dotfiles && git pull
./install.sh
```

### Push Local Changes

```
cd ~/three-dotfiles && git add -A && git commit -m "Update configs" && git push
```

Note: All configs in ~/.config/* are symlinked to ~/three-dotfiles/*, so edits anywhere automatically edit the repo.

---

## Prerequisites

Install via Homebrew:

```bash
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install --cask karabiner-elements
brew install --cask alacritty
brew install neovim
brew install ripgrep fd node
```

Start services:

```bash
yabai --start-service
skhd --start-service
```

Note: yabai requires accessibility permissions and may need SIP partially disabled for full functionality. See [yabai wiki](https://github.com/koekeishiya/yabai/wiki).
