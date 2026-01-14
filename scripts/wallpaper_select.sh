#!/usr/bin/env bash
# Wallpaper selector using Matugen-controlled swww (set=true)

set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
SYMLINK_PATH="$HOME/.config/hypr/current_wallpaper"
HYPRLOCK_WALL="$HOME/.config/hypr/hyprlock_wallpaper.png"

cd "$WALLPAPER_DIR" || exit 1
IFS=$'\n'

# === ROFI SELECTION ===
SELECTED_WALL=$(
  for a in $(ls -t *.jpg *.jpeg *.png *.gif *.webp 2>/dev/null); do
    echo -en "$a\0icon\x1f$WALLPAPER_DIR/$a\n"
  done | rofi -dmenu -show-icons -p "  Select Wallpaper"
)

[ -z "$SELECTED_WALL" ] && exit 0
SELECTED_PATH="$WALLPAPER_DIR/$SELECTED_WALL"
echo "🖼 Selected wallpaper: $SELECTED_PATH"

# === RUN MATUGEN (handles its own swww img call via config.toml) ===
if command -v matugen >/dev/null; then
  echo "🎨 Generating Matugen theme and applying wallpaper..."
  matugen image --type scheme-vibrant "$SELECTED_PATH"
else
  echo "❌ Matugen not found!"
  exit 1
fi

# === OPTIONAL SWAYNC RELOAD ONLY ===
(
  sleep 0.7
  if command -v swaync-client >/dev/null; then
    swaync-client -R || { pkill swaync || true; swaync & disown; }
  fi
) & disown

# === UPDATE SYMLINKS (Hyprland + Hyprlock) ===
mkdir -p "$(dirname "$SYMLINK_PATH")"
ln -sf "$SELECTED_PATH" "$SYMLINK_PATH"

mkdir -p "$(dirname "$HYPRLOCK_WALL")"
ln -sf "$SELECTED_PATH" "$HYPRLOCK_WALL"

echo "✅ Wallpaper applied and Matugen theme updated via config.toml."
echo "   $SELECTED_PATH"
