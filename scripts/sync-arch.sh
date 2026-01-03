#!/bin/bash

# 1. Capture the argument
PACKAGES_FILE="$1"

echo ":: Syncing to changes..."

# 2. Check if the argument was provided and if the file exists
if [[ -z "$PACKAGES_FILE" ]]; then
    echo "Error: No package list path provided."
    echo "Usage: ./sync-arch.sh /path/to/packages.txt"
    exit 1
fi

if [[ ! -f "$PACKAGES_FILE" ]]; then
    echo "Error: Package list not found at: $PACKAGES_FILE"
    exit 1
fi

# 3. Read packages, ignoring comments and empty lines
PACKAGES=$(grep -v '^#' "$PACKAGES_FILE" | xargs)

# 4. System Update & Base Tools
sudo pacman -Syu --needed --noconfirm base-devel git

# 5. Install AUR/Official packages via yay
if command -v yay &> /dev/null; then
    yay -S --needed --noconfirm $PACKAGES
else
    echo ":: yay not found. Please install an AUR helper to process the list."
fi

# 6. Zsh and Zap Framework
echo ":: Setting up Zsh and Zap..."
if [ ! -d "$HOME/.local/share/zap" ]; then
    # --keep ensures your dot_zshrc from Chezmoi isn't deleted
    zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
fi

# 7. Default Shell Change
if [[ "$SHELL" != */zsh ]]; then
    echo ":: Changing default shell to Zsh..."
    chsh -s "$(which zsh)"
fi

echo ":: Sync completed"
