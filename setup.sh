#!/bin/bash

echo "Starting Omarchy Custom Setup..."

# 1. Restore Waybar Configuration
echo "Restoring Waybar config..."
mkdir -p ~/.config/waybar
cp -r ~/.config/omarchy/custom-configs/waybar/* ~/.config/waybar/
chmod +x ~/.config/waybar/nordvpn.sh
echo "Waybar config restored."

# 2. Restore Neovim Configuration
echo "Restoring Neovim config..."
# We backup the existing nvim config if it exists, just in case
if [ -d ~/.config/nvim ]; then
    echo "Backing up existing nvim config to ~/.config/nvim.bak..."
    mv ~/.config/nvim ~/.config/nvim.bak
fi
mkdir -p ~/.config/nvim
cp -r ~/.config/omarchy/custom-configs/nvim/* ~/.config/nvim/
echo "Neovim config restored."

# 3. Restore Obsidian Theme Script
# We moved this to scripts/ earlier
if [ -f ~/.config/omarchy/scripts/omarchy-theme-set-obsidian ]; then
    echo "Restoring Obsidian theme script..."
    # Ensure the target directory exists
    mkdir -p ~/.local/share/omarchy/bin/
    cp ~/.config/omarchy/scripts/omarchy-theme-set-obsidian ~/.local/share/omarchy/bin/
    chmod +x ~/.local/share/omarchy/bin/omarchy-theme-set-obsidian
    echo "Obsidian script restored."
fi

echo "Setup complete! You may need to reload Waybar, restart Neovim, or reload Omarchy."
