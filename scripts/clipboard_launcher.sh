#!/usr/bin/env bash

if pidof rofi > /dev/null; then
    pkill rofi
fi

cliphist list | rofi -dmenu --no-show-icons -p "Clipboard" | cliphist decode | wl-copy
