#!/usr/bin/env bash
# Random wallpaper selector with automatic color palette update via Matugen

set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
SYMLINK_PATH="$HOME/.config/hypr/current_wallpaper"
HYPRLOCK_WALL="$HOME/.config/hypr/hyprlock_wallpaper.png"

# Check if wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
  echo "❌ Wallpaper directory not found: $WALLPAPER_DIR"
  exit 1
fi

# Get list of wallpapers
cd "$WALLPAPER_DIR" || exit 1
WALLPAPERS=($(ls -1 *.jpg *.jpeg *.png *.gif *.webp 2>/dev/null || true))

if [ ${#WALLPAPERS[@]} -eq 0 ]; then
  echo "❌ No wallpapers found in $WALLPAPER_DIR"
  exit 1
fi

# Select random wallpaper
RANDOM_WALL="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"
RANDOM_PATH="$WALLPAPER_DIR/$RANDOM_WALL"
echo "🖼 Random wallpaper selected: $RANDOM_WALL"

# RUN MATUGEN (handles swww img call and color generation)
if command -v matugen >/dev/null; then
  echo "🎨 Generating Matugen theme and applying wallpaper..."
  matugen image --type scheme-vibrant "$RANDOM_PATH"
else
  echo "❌ Matugen not found!"
  exit 1
fi

# OPTIONAL SWAYNC RELOAD ONLY
(
  sleep 0.7
  if command -v swaync-client >/dev/null; then
    swaync-client -R || { pkill swaync || true; swaync & disown; }
  fi
) & disown

# UPDATE SYMLINKS (Hyprland + Hyprlock)
mkdir -p "$(dirname "$SYMLINK_PATH")"
ln -sf "$RANDOM_PATH" "$SYMLINK_PATH"

mkdir -p "$(dirname "$HYPRLOCK_WALL")"
ln -sf "$RANDOM_PATH" "$HYPRLOCK_WALL"

echo "✅ Random wallpaper applied and Matugen theme updated via config.toml."
echo "   $RANDOM_PATH"
