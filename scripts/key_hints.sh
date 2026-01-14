#!/usr/bin/env bash

if pidof yad > /dev/null; then
    pkill yad
fi

yad --center --title="Keybinding Hints" --no-buttons --list \
    --column=Key: --column="" --column=Description: \
    --timeout-indicator=bottom \
"  =  "               ""  "SUPER KEY (Windows Key Button)" \
"" "" "" \
"# --- Core actions ---" "" "" \
"  Return"             ""  "Open terminal" \
"  Shift Return"       ""  "Open floating terminal (800×550)" \
"  Q"                  ""  "Close active window" \
"Ctrl Alt Del"          ""  "Exit Hyprland session" \
"  E"                  ""  "Open file manager" \
"  Space"              ""  "Toggle floating window mode" \
"  D"                  ""  "Open app launcher (rofi)" \
"  P"                  ""  "Toggle pseudo (dwindle)" \
"  J"                  ""  "Toggle split (dwindle)" \
"  R"                  ""  "Restart Waybar (wbrestart.sh)" \
"  B"                  ""  "Open browser" \
"  L"                  ""  "Lock screen (Hyprlock)" \
"  Shift F"            ""  "Toggle fullscreen" \
"  Shift S"            ""  "Screenshot region" \
"  W"                  ""  "Open wallpaper picker" \
"  Shift Q"            ""  "Kill active process" \
"  C"                  ""  "Color picker (hyprpicker -a)" \
"  Ctrl B"             ""  "Waybar style switcher" \
"  Alt B"              ""  "Waybar layout menu" \
"  Shift H"            ""  "Toggle Waybar visibility" \
"  H"                  ""  "Show keybinding hints" \
"  Shift E"            ""  "Open Yazi file manager" \
"" "" "" \
"# --- Focus movement ---" "" "" \
"  ← / → / ↑ / ↓"       ""  "Move focus between windows" \
"" "" "" \
"# --- Move windows ---" "" "" \
"  Ctrl ← / → / ↑ / ↓"  ""  "Move windows" \
"" "" "" \
"# --- Resize windows ---" "" "" \
"  Shift ← / → / ↑ / ↓" ""  "Resize active window" \
"" "" "" \
"# --- Workspaces ---" "" "" \
"  1–0"                ""  "Switch to workspace 1–10" \
"  Shift 1–0"          ""  "Move active window to workspace 1–10" \
"" "" "" \
"# --- Workspace scroll ---" "" "" \
"  Mouse Scroll Up"     ""  "Previous workspace" \
"  Mouse Scroll Down"   ""  "Next workspace" \
"" "" "" \
"# --- Drag move / resize ---" "" "" \
"  Mouse LMB Drag"      ""  "Move window" \
"  Mouse RMB Drag"      ""  "Resize window" \
"" "" "" \
"# --- Audio / Brightness ---" "" "" \
"Audio + / – / Mute"      ""  "Adjust volume" \
"Mic Mute"                ""  "Toggle microphone mute" \
"Brightness + / –"        ""  "Adjust brightness" \
"" "" "" \
"# --- Media keys ---" "" "" \
"⏮ / ⏯ / ⏭"              ""  "Previous / Play‑Pause / Next track" \
"" "" "" \
"# --- Utilities ---" "" "" \
"  V"                  ""  "Clipboard manager" \
"  ."                  ""  "Emoji picker" \
"" "" "" \
"Additional config"     ""  "$HOME/.config/hypr/hyprland.conf"
