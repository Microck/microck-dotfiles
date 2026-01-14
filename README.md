# microck's Hyprland Dotfiles

A clean, modern, and feature-rich Arch Linux Hyprland setup with automatic theme generation and custom scripts.

## 🖼️ Preview

This dotfiles setup features:
- **Hyprland** - Dynamic tiling Wayland compositor
- **Waybar** - Customizable status bar
- **Kitty** - GPU-accelerated terminal emulator
- **Matugen** - Automatic Material You color theming
- **Spicetify** - Customized Spotify client
- **Swaync** - Notification center
- **Spotifyd/Spotify-player** - Spotify daemon & terminal client
- And more!

## ✨ Features

- 🎨 **Automatic color theming** - Colors generated from your wallpaper using Matugen
- 🖼️ **Random wallpaper on startup** - Fresh look every time you boot
- 🎵 **Spicetify theming** - Spotify matches your system colors
- 💻 **Fully configured apps** - Terminal, bar, launcher, and more
- 🚀 **One-command installation** - Easy setup script included

## ❓ What are Dotfiles?

Dotfiles are configuration files for Unix-like systems that begin with a dot (.) to hide them. They store your personal settings, preferences, and customizations for applications and the system.

### What's typically included in dotfiles:

**Shell & Terminal:**
- Shell configs (.zshrc, .bashrc)
- Terminal emulator configs (kitty, alacritty)
- CLI tools (fastfetch, neofetch, htop)

**Window Manager:**
- Hyprland/i3/sway configs
- Waybar panels
- Application launchers (rofi)
- Window rules and keybinds

**Applications:**
- Text editors (vim, nvim, vscode)
- Music players (spotify, mpd)
- Notifications (swaync, dunst)
- Theming (gtk, qt)

**Automation:**
- Custom scripts
- systemd services
- Auto-start applications

This repository contains a curated selection of essential configs for a complete Hyprland setup.

## 📋 Requirements

### System
- **Arch Linux** (or Arch-based distro)
- **Wayland session**

### Required Packages

```bash
# Window Manager & Compositor
sudo pacman -S hyprland waybar swww matugen wireplumber

# Terminal & Apps
sudo pacman -S kitty rofi wlogout cava fastfetch

# Audio & Notifications
sudo pacman -S spotifyd spotify-player

# Theming & Customization
sudo pacman -S spicetify fcitx5 fcitx5-im fcitx5-gtk

# Utilities
sudo pacman -S zsh git
```

### Optional (AUR packages)
```bash
# Install yay if you don't have it
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si

# Install AUR packages (optional)
yay -S hyprpaper matugen-git spicetify-cli
```

## 🚀 Installation

1. **Clone or download this repository**
   ```bash
   git clone <your-repo-url>
   cd dotfiles
   ```

2. **Run the installation script**
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. **Restart Hyprland** (or reboot your system)

4. **Apply changes**
   ```bash
   hyprctl reload
   ```

## 📁 Structure

```
dotfiles/
├── config/
│   ├── hypr/            # Hyprland configuration
│   ├── waybar/          # Waybar bar configuration
│   ├── kitty/           # Kitty terminal config
│   ├── rofi/            # Rofi launcher config
│   ├── spicetify/       # Spotify theming
│   ├── swww/            # Wallpaper daemon config
│   ├── matugen/         # Color theming config
│   ├── swaync/          # Notification center config
│   ├── wireplumber/     # PipeWire audio config
│   ├── wlogout/         # Logout menu config
│   ├── spotifyd/        # Spotify daemon config
│   ├── spotify-player/   # Terminal Spotify client
│   ├── fcitx5/         # Input method config
│   ├── cava.conf        # Audio visualizer config
│   ├── fastfetch.jsonc  # System info config
│   ├── zshrc            # Zsh shell config
│   └── gtkrc-2.0        # GTK2 config
├── scripts/             # Custom scripts
├── docs/                # Documentation
├── install.sh           # Installation script
├── README.md            # This file
└── LICENSE              # MIT License
```

## 🎨 Customization

### Wallpapers

Place your wallpapers in:
```
~/Pictures/Wallpapers/
```

Supported formats: `.jpg`, `.jpeg`, `.png`, `.gif`, `.webp`

### Keybinds

Open the keybinds config:
```
~/.config/hypr/keybinds.conf
```

Common keybinds:
- `SUPER + W` - Select wallpaper (manual)
- `SUPER + SHIFT + W` - Random wallpaper
- `SUPER + Return` - Open terminal
- `SUPER + D` - Application launcher
- `SUPER + Q` - Close window
- `SUPER + L` - Lock screen

### Color Schemes

Colors are automatically generated from your wallpaper using Matugen. To change the color scheme:

1. Change your wallpaper (SUPER + W or SUPER + SHIFT + W)
2. Matugen will automatically generate a new color palette
3. All apps reload with new colors

To customize Matugen settings:
```
~/.config/matugen/config.toml
```

## 📱 App Configurations

### Waybar
Located in `~/.config/waybar/`
- Multiple styles available
- Custom modules
- Themes generated by Matugen

### Kitty
Located in `~/.config/kitty/`
- Color theming
- Font settings
- Keybindings

### Rofi
Located in `~/.config/rofi/`
- Application launcher
- Window switcher
- Drun menu

### Spicetify
Located in `~/.config/spicetify/`
- Custom theme
- Color theming
- Extensions

### Spicetify
Located in `~/.config/spicetify/`
- Custom theme
- Color theming
- Extensions

### Spotify (Spotifyd/Spotify-player)
Located in `~/.config/spotifyd/` and `~/.config/spotify-player/`
- Spotify daemon for background playback
- Terminal-based Spotify client
- Note: Requires credentials (see setup below)

### Swaync
Located in `~/.config/swaync/`
- Notification center
- Control center
- Theme integration

## 🎵 Spotify Setup

### Spotifyd Setup
1. Copy the example config:
   ```bash
   cp ~/.config/spotifyd/spotifyd.conf.example ~/.config/spotifyd/spotifyd.conf
   ```

2. Edit with your Spotify credentials:
   ```bash
   nano ~/.config/spotifyd/spotifyd.conf
   ```
   - Use your Spotify email and password
   - Or generate a device password at https://www.spotify.com/account/set-device-password/

3. Enable and start the service:
   ```bash
   systemctl --user enable --now spotifyd
   ```

### Spotify-player Setup
1. Get Spotify developer credentials:
   - Go to https://developer.spotify.com/dashboard
   - Create a new application
   - Set Redirect URI to: `http://127.0.0.1:8888/callback`

2. Copy the example config:
   ```bash
   cp ~/.config/spotify-player/app.toml.example ~/.config/spotify-player/app.toml
   ```

3. Edit with your developer credentials:
   ```bash
   nano ~/.config/spotify-player/app.toml
   ```

4. Run spotify-player:
   ```bash
   spotify-player
   ```

## 🔧 Scripts

Custom scripts located in:
- `~/.config/microck/` - General scripts
- `~/.config/hypr/scripts/` - Hyprland-specific scripts

Available scripts:
- `wallpaper_random.sh` - Random wallpaper with color theming
- `wallpaper_select.sh` - Manual wallpaper selection
- `wallpaper_effects.sh` - Apply effects to wallpaper
- `key_hints.sh` - Show keybind hints
- And more...

## 🐛 Troubleshooting

### Wallpaper not changing
```bash
# Restart swww daemon
pkill swww
swww-daemon
```

### Colors not applying
```bash
# Regenerate colors manually
matugen image --type scheme-vibrant ~/.config/hypr/current_wallpaper
```

### Hyprland not reloading
```bash
# Restart Hyprland completely
# Or use: hyprctl reload
```

### Waybar issues
```bash
# Restart Waybar
pkill waybar
waybar
```

## 📦 Backup

The installation script automatically backs up your existing configs to:
```
~/dotfiles-backup-YYYYMMDD-HHMMSS/
```

## 🤝 Contributing

Feel free to fork, modify, and use this setup for your own needs!

## 📄 License

Feel free to use these dotfiles however you like.

## 👤 Author

**microck**

## 🙏 Credits

Based on various Hyprland configurations and the Arch Linux community.

---

**Enjoy your new setup! 🎉**
