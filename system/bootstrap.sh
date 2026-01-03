#!/bin/bash
set -e

# Update system
sudo pacman -Syu --noconfirm

# Install essential system services
CORE_PKGS=(
    sddm
    hyprland
    NetworkManager
    bluez bluez-utils
    pipewire wireplumber pipewire-pulse 
    pipewire-alsa pipewire-jack libpulse
)

GAMING_PKGS=("steam" "lib32-vkd3d" "vkd3d" "gamemode" "lib32-gamemode" "wine" "wine-gecko" "wine-mono" "freetype2" "flatpak" "v4l2loopback-dkms" "v4l2loopback-utils" "v4l-utils" "pipewire-v4l2" "lib32-pipewire-v4l2" "mangohud" "gamescope" "goverlay" "protonup-qt")

BASIC_APPS=("discord" "vlc" "librewolf-bin" "libreoffice-fresh" "krita" "cheese" "obsidian")

if ! command -v paru &> /dev/null; then
    echo ":: Installing paru-bin..."
    TEMP_DIR=$(mktemp -d)
    git clone https://aur.archlinux.org/paru.git "$TEMP_DIR"
    cd "$TEMP_DIR" && makepkg -si --noconfirm
    cd - && rm -rf "$TEMP_DIR"
fi

install_optional_packages() {
    local prompt="$1"
    local pkgs=("${!2}")
    read -p "$prompt [y/N]: " response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        echo ":: Installing ${pkgs[*]}..."
        paru -S --needed --noconfirm "${pkgs[@]}"
    fi
}

paru -S --needed --noconfirm "${CORE_PKGS[@]}"
install_optional_packages "Install Gaming Packages?" GAMING_PKGS[@]
install_optional_packages "Install Basic Applications?" BASIC_APPS[@]


# Enable services
sudo systemctl enable --now sddm
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth

systemctl --user enable --now pipewire wireplumber pipewire-pulse

# Optional: enable fstrim for SSDs
sudo systemctl enable --now fstrim.timer

