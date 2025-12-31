# Danarchy Setup Guide

## Project Context
"Danarchy" is a custom configuration suite built on top of **Omarchy**. It manages:
- **Omarchy Themes:** (e.g., Cybermystic)
- **Waybar:** Custom layouts and scripts (stored in `custom-configs/waybar`, restored to `~/.config/waybar`).
- **Neovim:** Custom setup (stored in `custom-configs/nvim`, restored to `~/.config/nvim`).
- **Obsidian:** Auto-generation scripts.

## Installation / Restoration Protocol
When asked to "Install Danarchy" or "Restore Config", perform the following steps in order. 
**Prerequisite:** The user must have the base Omarchy installed and SSH keys for GitHub configured.

### 1. Clean Slate
Remove the default configuration created by the fresh Omarchy install.
```bash
rm -rf ~/.config/omarchy
# OR backup if requested: mv ~/.config/omarchy ~/.config/omarchy.bak
```

### 2. Clone Repository
Clone the Danarchy repository into the config directory.
```bash
git clone git@github.com:danfanclub/danarchy.git ~/.config/omarchy
```

### 3. Run Restoration Script
Execute the included setup script. This is CRITICAL. It moves the detached configs (Waybar, Nvim) to their active system locations.
```bash
chmod +x ~/.config/omarchy/setup.sh
~/.config/omarchy/setup.sh
```

### 4. Activate Theme
Apply the primary custom theme to finalize the visual setup.
```bash
omarchy-theme-set cybermystic
```

## Maintenance
- **Updating:** Pull changes in `~/.config/omarchy` and re-run `./setup.sh` if system configs (Waybar/Nvim) were changed.
- **Saving Changes:** Commit changes in `~/.config/omarchy`. If `~/.config/waybar` or `~/.config/nvim` were modified, copy them back to `custom-configs/` BEFORE committing.
