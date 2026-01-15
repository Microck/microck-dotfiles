#!/usr/bin/env bash
# Dotfiles Installation Script
# Author: microck
# Description: Installs and configures the dotfiles

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "🚀 Starting dotfiles installation..."
echo "📁 Dotfiles directory: $DOTFILES_DIR"

# Create backup directory
echo "📦 Creating backup directory..."
mkdir -p "$BACKUP_DIR"

# Backup existing configs
backup_config() {
    local src="$1"
    local dest="$BACKUP_DIR/$(basename "$src")"
    if [ -e "$src" ]; then
        echo "💾 Backing up: $src -> $dest"
        cp -r "$src" "$dest" 2>/dev/null || true
    fi
}

# Backup configs before overwriting
backup_config "$CONFIG_DIR/hypr"
backup_config "$CONFIG_DIR/waybar"
backup_config "$CONFIG_DIR/kitty"
backup_config "$CONFIG_DIR/rofi"
backup_config "$CONFIG_DIR/spicetify"
backup_config "$CONFIG_DIR/swww"
backup_config "$CONFIG_DIR/matugen"
backup_config "$CONFIG_DIR/wlogout"
backup_config "$CONFIG_DIR/cava"
backup_config "$CONFIG_DIR/swaync"
backup_config "$CONFIG_DIR/wireplumber"
backup_config "$CONFIG_DIR/spotifyd"
backup_config "$CONFIG_DIR/spotify-player"
backup_config "$CONFIG_DIR/yazi"
backup_config "$CONFIG_DIR/waypaper"
backup_config "$HOME/.zshrc"

# Copy configs
echo "📋 Installing configs..."
cp -r "$DOTFILES_DIR/config/linux/hypr" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/config/linux/waybar" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/config/linux/kitty" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/config/linux/rofi" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/config/linux/spicetify" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/config/linux/swww" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/config/linux/matugen" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/config/linux/wlogout" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/config/linux/swaync" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/config/linux/wireplumber" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/config/linux/spotifyd" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/config/linux/spotify-player" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/config/linux/yazi" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/config/linux/waypaper" "$CONFIG_DIR/"
cp -r "$DOTFILES_DIR/config/fcitx5" "$CONFIG_DIR/" 2>/dev/null || true

# Copy other configs
mkdir -p "$CONFIG_DIR/cava"
cp "$DOTFILES_DIR/config/linux/cava.conf" "$CONFIG_DIR/cava/config" 2>/dev/null || true
cp "$DOTFILES_DIR/config/linux/fastfetch.jsonc" "$CONFIG_DIR/fastfetch/config.jsonc" 2>/dev/null || true
cp "$DOTFILES_DIR/config/linux/zshrc" "$HOME/.zshrc" 2>/dev/null || true
cp "$DOTFILES_DIR/config/linux/gtkrc-2.0" "$HOME/.gtkrc-2.0" 2>/dev/null || true

# Install scripts
echo "🔧 Installing scripts..."
mkdir -p "$CONFIG_DIR/microck"
mkdir -p "$CONFIG_DIR/hypr/scripts"
cp -r "$DOTFILES_DIR/scripts"/* "$CONFIG_DIR/microck/" 2>/dev/null || true
cp -r "$DOTFILES_DIR/scripts"/* "$CONFIG_DIR/hypr/scripts/" 2>/dev/null || true

# Make scripts executable
chmod +x "$CONFIG_DIR/microck"/*.sh 2>/dev/null || true
chmod +x "$CONFIG_DIR/hypr/scripts"/*.sh 2>/dev/null || true

# Create necessary directories
echo "📁 Creating directories..."
mkdir -p "$HOME/Pictures/Wallpapers"
mkdir -p "$HOME/Pictures/Screenshots"
mkdir -p "$HOME/.config/hypr"

echo ""
echo "⚠️  System configs (Ly & GRUB) located in config/system/"
echo "    - config/system/ly/ - Login manager configuration"
echo "    - config/system/grub/ - Bootloader configuration"
echo "    - These require manual installation with sudo"

# Set up wallpaper symlinks
if [ -f "$HOME/Pictures/Wallpapers/$(ls ~/Pictures/Wallpapers/ 2>/dev/null | head -1)" ]; then
    first_wallpaper="$HOME/Pictures/Wallpapers/$(ls ~/Pictures/Wallpapers/ 2>/dev/null | head -1)"
    ln -sf "$first_wallpaper" "$HOME/.config/hypr/current_wallpaper" 2>/dev/null || true
    ln -sf "$first_wallpaper" "$HOME/.config/hypr/hyprlock_wallpaper.png" 2>/dev/null || true
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "📝 Next steps:"
echo "1. Reboot or restart Hyprland to apply changes"
echo "2. Run: hyprctl reload"
echo "3. Backup saved to: $BACKUP_DIR"
echo ""
echo "⚠️  Note: Make sure you have the following packages installed:"
echo "   - hyprland"
echo "   - waybar"
echo "   - kitty"
echo "   - rofi"
echo "   - swww"
echo "   - matugen"
echo "   - spicetify"
echo "   - cava"
echo "   - wlogout"
echo "   - swaync"
echo "   - spotifyd"
echo "   - spotify-player"
echo "   - wireplumber"
echo ""
echo "🎵 For Spotify functionality:"
echo "   1. Copy: ~/.config/spotifyd/spotifyd.conf.example -> spotifyd.conf"
echo "   2. Edit with your Spotify credentials"
echo "   3. Copy: ~/.config/spotify-player/app.toml.example -> app.toml"
echo "   4. Edit with Spotify developer credentials"
