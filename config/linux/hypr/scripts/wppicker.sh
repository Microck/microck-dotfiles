#!/usr/bin/env bash
# Generate a thumbnail of the current wallpaper using vips

CACHE_DIR="$HOME/.cache/swww"
mkdir -p "$CACHE_DIR"

# Parse current wallpaper path from swww
WALL=$(swww query | grep -oP '(?<=image: ).*' | head -n 1)

[ -z "$WALL" ] && echo "No wallpaper found from swww query." && exit 1

OUT_FILE="$CACHE_DIR/normal.png"
rm -f "$OUT_FILE"

if command -v vipsthumbnail >/dev/null 2>&1; then
    vipsthumbnail "$WALL" -s 400x250 -o "$OUT_FILE"
else
    echo "vipsthumbnail not found — install libvips."
fi
