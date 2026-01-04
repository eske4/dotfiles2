# Dotfiles

My personal Arch Linux + Hyprland and Noctalia dotfile configuration, managed with chezmoi.

![Desktop Screenshot](assets/desktop.png)

---

## Desktop Setup

Follow the steps below to set up the desktop environment correctly.

1. Do not clone this repository directly.  
   Use chezmoi instead:
   chezmoi init --apply https://github.com/eske4/dotfiles

2. After chezmoi finishes, update the Git configuration to match your own setup.  
   The default configuration uses my SSH settings.

3. There are optional Hyprbar-style window decorations commented out in:
   .config/hypr/window-rules  
   Enabling these will give each window a UI similar to Windows. Install hypr plugin hyprbars
   hyprpm add https://github.com/hyprwm/hyprland-plugins
   hyprpm enable hyprbars

4. Apply your own desktop wallpaper.
   - 5 default wallpapers are included
   - Place wallpapers in:
     ~/Pictures/Wallpapers

5. To apply the desktop theme to Firefox / LibreWolf:
   1. Install Pywalfox:
      yay -S python-pywalfox
   2. Install the browser extension:
      https://addons.mozilla.org/en-US/firefox/addon/pywalfox/

6. Discord theming is also supported.  
   Refer to the Noctalia documentation for setup details.

---

## Dependencies

### Core Desktop
- Hyprland (git) — Wayland compositor
- Noctalia-shell — UI
- SDDM (git) — Login display manager
- GTK — Graphical toolkit

### Hyprland Utilities
- Hypridle — Idle / inactivity handler
- Hyprpolkitagent — PolicyKit authentication agent


### Terminal & Shell
- Kitty — Terminal emulator
- Zsh — Shell environment
- Starship — Shell prompt

### Audio
- PipeWire — Audio engine
- WirePlumber — PipeWire session manager
- Pavucontrol — Audio control UI

### Media & Utilities
- Grim + Slurp — Screenshot tools
- Swappy — Screenshot editor
- Cliphist — Clipboard manager
- Udiskie — External drive manager


---

## Keybindings

mainMod refers to the Windows / Super key.

### General
- mainMod + T — Open terminal
- mainMod + Q — Close focused application
- mainMod + M — Exit Hyprland
- mainMod + E — Open file manager
- mainMod + F — Toggle float for windows
- mainMod + SPACE — Application launcher
- mainMod + F11 — Toggle fullscreen
- mainMod + B — Open browser

### Window Management
- mainMod + h / j / k / l — Move focus
- mainMod + SHIFT + h / j / k / l — Resize window
- mainMod + Right Click — Resize window with mouse
- mainMod + Mouse Wheel — Switch workspaces

### Workspace Management
- mainMod + 1–10 — Switch workspaces
- mainMod + SHIFT + 1–10 — Move window to workspace
- mainMod + V — Clipboard history
- mainMod + C — Command viewer

### Special Workspace
- mainMod + S — Toggle special workspace
- mainMod + SHIFT + S — Move window to special workspace

### Miscellaneous
- Print Screen — Screenshot (Grim, Slurp, Swappy)
- Fn keys — Volume and brightness control


