# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

This is an **Omarchy theme** named "cybermystic" - a cyberpunk-inspired color scheme with deep purple backgrounds and neon fuschia/cyan accents. It's part of the Omarchy Linux distribution's theming system.

## How Omarchy Themes Work

Omarchy themes are **collections of config files** for different applications. When you apply a theme with `omarchy-theme-set cybermystic`, the system:

1. Symlinks `~/.config/omarchy/current/theme` → this directory
2. Restarts various system components (waybar, terminals, hyprland, btop, etc.)
3. **Auto-generates themes** for applications like Obsidian, VSCode, browsers

## Theme File Structure

Each file in this directory configures a different application:

- **alacritty.toml** - Terminal emulator colors (PRIMARY color source)
- **btop.theme** - System monitor colors
- **neovim.lua** - Neovim/LazyVim colorscheme
- **artforge.override.css** - GTK application theming
- **hyprland.conf** - Window manager colors
- **waybar.css** - Status bar colors
- **kitty.conf** / **ghostty.conf** / **warp.yaml** - Alternative terminals
- **vscode.json** / **chromium.theme** / **icons.theme** - Generated app themes
- **backgrounds/** - Wallpapers for this theme

## Critical Color Dependencies

**IMPORTANT**: Some colors have special significance beyond their immediate file:

### alacritty.toml
- `[colors.primary]` background/foreground → Used as BASE colors for all auto-generated themes
- `[colors.selection]` → Used by Obsidian theme generation
- `[colors.normal]` through `[colors.bright]` → Collected into frequency-sorted palette

### btop.theme
- `theme[div_line]` → **Becomes border color in Obsidian theme**
  - This has caused UI readability issues when set to bright colors
  - Should be a subtle, low-contrast color
  - If removed, auto-generates to a darker shade

## Obsidian Theme Generation (Deep Dive)

The Obsidian theme auto-generation is handled by `~/.local/share/omarchy/bin/omarchy-theme-set-obsidian` and runs automatically when you apply a theme.

### How It Works

**Step 1: Vault Discovery**
- Reads `~/.config/obsidian/obsidian.json` to find all Obsidian vaults
- Saves vault paths to `~/.local/state/omarchy/obsidian-vaults`

**Step 2: For Each Vault**
- Ensures `.obsidian/themes/Omarchy/` directory exists
- Creates `manifest.json` if missing (static file, version 1.0.0)
- Updates `theme.css` using one of two methods:

**Method A: Custom Theme (if `obsidian.css` exists in this directory)**
```bash
cp ~/.config/omarchy/themes/cybermystic/obsidian.css → <vault>/.obsidian/themes/Omarchy/theme.css
```

**Method B: Auto-Generation (if no `obsidian.css` exists)**

The generation script performs these steps:

1. **Extract Base Colors** from `alacritty.toml`:
   - Background: `[colors.primary] background`
   - Foreground: `[colors.primary] foreground`
   - Fallbacks: bg=`#1a1b26`, fg=`#a9b1d6`
   - Calculate brightness to determine light/dark theme

2. **Collect All Colors with Frequency Counting**:
   - From `alacritty.toml`:
     - Primary colors (background, foreground, cursor, text)
     - `[colors.normal]` section (8 colors)
     - `[colors.bright]` section (8 colors)
     - `[colors.dim]` section if present (8 colors)
     - `[colors.selection]` section (background, text)
   - From `waybar.css`: all `@define-color` declarations
   - From `hyprland.conf`: `col.active_border` and `col.inactive_border` (converts rgba→hex)
   - Each occurrence increments that color's frequency count

3. **Generate Special Colors**:

   **Code Background**:
   - If dark theme (brightness ≤ 127): `bg + 15` to RGB values
   - If light theme: `bg - 10` to RGB values
   - Clamped to 0-255 range

   **Code Foreground**:
   - Find closest color to foreground using Euclidean RGB distance
   - Fallback: `#e0e0e0`

   **Border Color** (IMPORTANT):
   - Extracted from `btop.theme` line: `theme[div_line]="#xxxxxx"`
   - If missing: creates blended mix `(bg + fg) / 3` biased toward bg
   - **This is what caused your button readability issues**

   **Selection Colors**:
   - From `alacritty.toml [colors.selection]`
   - Respects `CellForeground`/`CellBackground` special values
   - If missing: background = 75% bg + 25% fg
   - Text chosen for contrast vs selection background

4. **Fill 13 Semantic Color Slots**:
   - Remove bg/fg from color list
   - Sort remaining colors by frequency (most used first)
   - Cycle through sorted colors to fill slots:
     1. `--text-title-h1` (Headings)
     2. `--text-title-h2`
     3. `--text-title-h3`
     4. `--text-title-h4`
     5. `--text-title-h5`
     6. `--text-title-h6`
     7. `--text-link` (Links)
     8. `--markup-code` (Inline code)
     9. `--text-mark` (Highlights)
     10. `--interactive-accent` (Buttons, active items)
     11. `--blockquote-border`
     12. `--text-muted`
     13. `--text-faint`
   - If fewer than 13 colors available, cycles through list

5. **Extract Fonts**:
   - Monospace: from `alacritty.toml [font]` or fontconfig
   - UI font: from fontconfig sans-serif

6. **Write CSS Template**:
   - Generates complete `theme.css` with:
     - CSS variable definitions (lines 5-86 in generated file)
     - All background variations (all set to same `#1c021f` currently)
     - Obsidian element styling (headers, code blocks, tables, etc.)
     - Generated timestamp comment at top

### Common Issues

**Problem**: Buttons/dropdowns unreadable (light text on light background)
**Cause**: `btop.theme theme[div_line]` set to a bright color
**Solution**: Delete that line or set it to a dark, subtle color

**Problem**: Everything looks the same color
**Cause**: Not enough color variety in source files, or colors appearing with equal frequency
**Solution**: Either create custom `obsidian.css` or adjust color distribution in source files

**Problem**: Code blocks hard to read
**Cause**: Code background too close to main background
**Solution**: The generator only adds ±10-15 RGB. Create custom `obsidian.css` for more control

## Making Changes

### To modify terminal/UI colors:
Edit the relevant config file directly, then run:
```bash
omarchy-theme-set cybermystic
```

### To customize Obsidian theme (Option 1 - Custom CSS):
Create `obsidian.css` in this directory with your custom CSS. This will bypass auto-generation entirely and be copied directly to all Obsidian vaults.

Example workflow:
```bash
# Copy the current auto-generated theme as a starting point
cp ~/Documents/WondrousWorks/.obsidian/themes/Omarchy/theme.css ./obsidian.css

# Edit obsidian.css to customize colors for better contrast
# Then re-apply theme
omarchy-theme-set cybermystic
```

### To customize Obsidian theme (Option 2 - Tweak Auto-Generation):
Modify the source files that the generator reads from:

- **For different UI element colors**: Add/modify colors in `waybar.css`, `alacritty.toml`, `hyprland.conf`
- **For border colors**: Edit `btop.theme theme[div_line]`
- **For selection colors**: Edit `alacritty.toml [colors.selection]`

Then re-apply: `omarchy-theme-set cybermystic`

### To customize Obsidian theme (Option 3 - CSS Snippets):
Create vault-specific overrides without modifying the theme:
```bash
# Create a snippet in your Obsidian vault
mkdir -p ~/Documents/WondrousWorks/.obsidian/snippets/
nano ~/Documents/WondrousWorks/.obsidian/snippets/custom-colors.css
```

Enable it in: Obsidian Settings → Appearance → CSS snippets

This won't be overwritten when themes are re-applied.

## Testing Changes

After editing theme files:
```bash
# Apply the theme to see changes
omarchy-theme-set cybermystic

# Check which theme is currently active
omarchy-theme-current

# For Obsidian specifically, you can re-run just the Obsidian updater
omarchy-theme-set-obsidian
```

## Color Palette Reference

Primary colors in this theme:
- Background: `#1C021F` (deep purple)
- Foreground: `#ff5c8a` (neon fuschia)
- Accent blues: `#03edf9`, `#36f9f6` (electric cyan)
- Accent greens: `#72f1b8` (mint)
- Accent yellows: `#fede5d` (gold)
- Accent reds: `#fe4450` (hot pink)
- Accent magentas: `#ff7edb` (bright magenta)

## Repository Management

This is a git repository. Standard git workflow applies:
```bash
git status
git add <files>
git commit -m "message"
git push
```
