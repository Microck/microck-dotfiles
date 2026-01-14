# ~/.config/hypr/scripts/volume_safe.sh
#!/bin/bash
# Wrapper for wpctl set-volume with a hard 100% (1.0) limit.

sink="@DEFAULT_AUDIO_SINK@"
step="0.05"  # 5%

case "$1" in
  up)
    # Increase volume, then clamp if > 1.0
    wpctl set-volume "$sink" "${step}+"
    current=$(wpctl get-volume "$sink" | awk '{print $2}')
    [ "$(echo "$current > 1.0" | bc -l)" -eq 1 ] && wpctl set-volume "$sink" 1.0
    ;;
  down)
    wpctl set-volume "$sink" "${step}-"
    ;;
  toggle)
    wpctl set-mute "$sink" toggle
    ;;
esac
