#!/bin/bash

set -e

# Install essential system services
CORE_PKGS=(chezmoi sddm hyprland networkmanager bluez bluez-utils pipewire wireplumber pipewire-pulse pipewire-alsa pipewire-jack libpulse power-profiles-daemon udiskie xdg-user-dirs linux linux-headers brightnessctl)
GAMING_PKGS=(steam lib32-vkd3d vkd3d gamemode lib32-gamemode wine wine-gecko wine-mono freetype2 flatpak v4l2loopback-dkms v4l2loopback-utils v4l-utils pipewire-v4l2 lib32-pipewire-v4l2 mangohud gamescope goverlay protonup-qt)
BASIC_APPS=(discord vlc librewolf-bin libreoffice-fresh krita cheese obsidian)

# Update system
sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel debugedit

if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
    echo ":: Enabling Multilib repository..."
    sudo sed -i -e '/#\[multilib\]/,+1s/^#//' /etc/pacman.conf 
    sudo pacman -Sy
fi

# install yay
if ! command -v yay &> /dev/null; then
    echo ":: Installing yay..."
    TEMP_DIR=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$TEMP_DIR"
    cd "$TEMP_DIR" && makepkg -si --noconfirm
    cd - && rm -rf "$TEMP_DIR"
fi

install_optional_packages() {
    local prompt="$1"
    local pkgs=("${!2}")
    read -p "$prompt [y/N]: " response < /dev/tty
    if [[ "$response" =~ ^[Yy]$ ]]; then
        echo ":: Installing ${pkgs[*]}..."
        yay -S --needed --noconfirm "${pkgs[@]}"
    fi
}

yay -S --needed --noconfirm "${CORE_PKGS[@]}"
install_optional_packages "Install Gaming Packages?" GAMING_PKGS[@]
install_optional_packages "Install Basic Applications?" BASIC_APPS[@]


echo ":: Enabling services..."
sudo systemctl enable sddm
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
sudo systemctl enable --now power-profiles-daemon

systemctl --user enable --now pipewire wireplumber pipewire-pulse

# Optional: enable fstrim for SSDs
sudo systemctl enable --now fstrim.timer

# --- 2. XDG Folder Structure (User level) ---
# Ensure the package is installed first (xdg-user-dirs)
if command -v xdg-user-dirs-update &> /dev/null; then
    echo ":: Updating standard folder structure..."
    xdg-user-dirs-update
fi

echo "Done! Please reboot to enter Hyprland."
