# Dotfiles

My personal Arch Linux + Hyprland and Noctalia dotfile configuration, managed with chezmoi.

![Desktop Screenshot](assets/desktop.png)

---

## Installation

> [!IMPORTANT]
> Do **not** clone this repository directly. Use **chezmoi** to initialize the setup:

### 1. Initialize
On a fresh Arch Linux installation, run:

```bash
sudo pacman -S chezmoi
chezmoi init --apply https://github.com/eske4/dotfiles
```

### 2. Interactive Setup
During the process, the installer will prompt you for two specific actions:

#### **A. The Bootstrap (System Environment)**
* **Prompt:** `:: Arch Linux detected. Do you want to run the bootstrap script?`
* **Action:** Installs **Hyprland** and configures core system services (Audio, Bluetooth, Network) along with basic utilities.
* **Choose Yes if:** You are on a fresh install and need a fully functional desktop environment.

#### **B. The Package Sync (Applications & UI)**
* **Prompt:** `:: Do you want to sync system packages now?`
* **Action:** Installs your web browser, UI components, and all software listed in `packages.txt`.
* **Choose No if:** You only want the configuration files (dotfiles) without installing additional software or changing your current package state.

---

### 🔄 Maintenance
To update your configurations or pull the latest changes from this repository later, simply run:

```bash
update
```

### Post-Installation Setup

Skip if you only came for the files and not the setup

1. **Git Identity**: Update the Git configuration to match your own setup. The default configuration uses my personal SSH and user settings.
2. **Wallpapers**: 
   - 5 default wallpapers are included.
   - Place your own images in `~/Pictures/Wallpapers`.
3. **Hyprbars (Optional)**: To enable Windows-like window decorations with rules, uncomment the no_bar setting in `.config/hypr/window-rules` and install the plugin:
   ```bash
   hyprpm add https://github.com/hyprwm/hyprland-plugins
   hyprpm enable hyprbars
   ```
4. **Browser Theming(Optional)**: To apply the theme to Firefox or LibreWolf:
   - Install Pywalfox: `yay -S python-pywalfox`
   - Install the [Pywalfox Browser Extension](https://addons.mozilla.org/en-US/firefox/addon/pywalfox/).
5. **Discord (Optional)**: Discord theming is supported. Refer to the [Noctalia documentation](https://docs.noctalia.dev) for setup details.

---

### Core Environment
* **Compositor:** Hyprland
* **Shell/UI:** Noctalia-shell
* **Display Manager:** SDDM
* **Toolkit:** GTK

### Utilities
* **Terminal:** Kitty
* **Shell:** Zsh + Starship prompt
* **Audio:** PipeWire, WirePlumber
* **Screenshots:** Grim, Slurp, Swappy
* **Misc:** Hypridle, Hyprpolkitagent, Cliphist, Udiskie


---

## Keybindings

The `mainMod` is the **Super** key.

| Keybinding | Action |
| :--- | :--- |
| `mainMod + T` | Open terminal |
| `mainMod + Q` | Close focused application |
| `mainMod + SPACE` | Application launcher |
| `mainMod + B` | Open browser |
| `mainMod + E` | Open file manager |
| `mainMod + F` | Toggle float |
| `mainMod + F11` | Toggle fullscreen |
| `mainMod + H/J/K/L` | Move focus |
| `mainMod + SHIFT + H/J/K/L` | Resize window |
| `mainMod + 1–10` | Switch workspaces |
| `mainMod + SHIFT + 1–10` | Move window to workspace |
| `mainMod + S` | Toggle special workspace |
| `mainMod + V` | Clipboard history |
| `Print Screen` | Screenshot (Grim + Slurp + Swappy) |
| `Fn Keys` | Volume & Brightness control |


