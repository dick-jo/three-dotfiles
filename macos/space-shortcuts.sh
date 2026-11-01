#!/bin/sh
# Native macOS desktop-switching shortcuts on hyper (⌃⌥⌘⇧, right_command via Karabiner).
#   hyper-1..6      Switch to Desktop N   (symbolic hotkeys 118-123)
#   hyper-left/right Move left/right a space (79, 81)
# Replaces yabai `space --focus`, broken on macOS 27. Idempotent.
# Desktops must exist (Mission Control) for their shortcut to do anything.

HYPER=1966080          # shift 0x20000 + ctrl 0x40000 + opt 0x80000 + cmd 0x100000
FN=8388608             # 0x800000, set on arrow keys
NOCHAR=65535

set_hotkey() { # id keycode modifiers
  defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add "$1" \
    "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>$NOCHAR</integer><integer>$2</integer><integer>$3</integer></array><key>type</key><string>standard</string></dict></dict>"
}

# id:keycode for digits 1-6 (keycodes are not sequential: 5=23, 6=22)
for pair in 118:18 119:19 120:20 121:21 122:23 123:22; do
  set_hotkey "${pair%%:*}" "${pair##*:}" "$HYPER"
done
set_hotkey 79 123 $((HYPER + FN))   # left arrow
set_hotkey 81 124 $((HYPER + FN))   # right arrow

/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
