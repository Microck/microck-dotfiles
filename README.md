# micr.dots

hyprland setup on arch linux. uses matugen for material you colors, plus spotifyd, swaync, and fully configured apps.

## setup

clone and run the installer.

```bash
git clone https://github.com/microck/micr.dots.git
cd micr.dots
chmod +x install.sh
./install.sh
```

restart hyprland to apply.

## requirements

**system**
- arch linux
- wayland

**packages**
- core: `hyprland`, `waybar`, `swww`, `matugen`, `wireplumber`
- apps: `kitty`, `rofi`, `wlogout`, `cava`, `fastfetch`, `songfetch`
- spotify: `spotifyd`, `spotify-player`, `spicetify`
- utils: `zsh`, `git`, `fcitx5`

**aur**
- `hyprpaper`, `matugen-git`, `spicetify-cli`
- `grub-minecraft-theme-git` - Pochita Minecraft GRUB theme

## features

- **theming**: matugen generates colors from wallpaper.
- **wallpapers**: random on boot, or manual selection.
- **audio**: full spotify integration (daemon + terminal client) with songfetch display.
- **notifications**: swaync with custom themes.
- **animations**: smooth hyprland animations (Nice preset from hyprzepyx).
- **media controls**: mpris integration in waybar.
- **music info**: songfetch displays current track with album art.

## spotify setup

**spotifyd**

1. copy config.
   ```bash
   cp ~/.config/spotifyd/spotifyd.conf.example ~/.config/spotifyd/spotifyd.conf
   ```
2. add credentials (email/password).
   ```bash
   nano ~/.config/spotifyd/spotifyd.conf
   ```
3. enable service.
   ```bash
   systemctl --user enable --now spotifyd
   ```

**spotify-player**

1. get client id from spotify dashboard. redirect uri: `http://127.0.0.1:8888/callback`.
2. copy config.
   ```bash
   cp ~/.config/spotify-player/app.toml.example ~/.config/spotify-player/app.toml
   ```
3. add credentials.
   ```bash
   nano ~/.config/spotify-player/app.toml
   ```
4. run.
   ```bash
   spotify-player
   ```

## structure

### user configs
configs in `~/.config/linux/`:

- `hypr/`: compositor
- `waybar/`: status bar
- `kitty/`: terminal
- `rofi/`: launcher
- `spicetify/`: spotify client
- `spotifyd/`: spotify daemon
- `spotify-player/`: terminal player
- `swaync/`: notifications
- `matugen/`: color theming
- `swww/`: wallpaper daemon
- `wireplumber/`: audio
- `gtk-3.0/`: GTK3 themes
- `gtk-4.0/`: GTK4 themes
- `yazi/`: file manager
- `waypaper/`: wallpaper GUI
- `cava.conf`: audio visualizer
- `fastfetch.jsonc`: system info
- `zshrc`: shell config

### system configs
system-level configs in `config/system/` (require manual installation):

- `ly/` - login manager (Ly) configuration
  - `config.ini` - Ly display manager settings
  - `save.ini` - saved session data
  - `README.md` - full documentation
- `grub/` - bootloader (GRUB) configuration
  - `grub-default.txt` - GRUB settings
  - `README.md` - Pochita Minecraft theme documentation

scripts in `~/.config/microck/`

## scripts

- `wallpaper_random.sh`: random wallpaper with matugen theming
- `wallpaper_select.sh`: manual wallpaper selection
- `wallpaper-rofi`: enhanced wallpaper picker with thumbnails (from hyprzepyx)
- `wallpaper_effects.sh`: apply effects to wallpaper
- `sysmaintenance.sh`: automated system cleanup (from hyprzepyx)
- `thumbgen.sh`: generate wallpaper thumbnails (from hyprzepyx)
- `key_hints.sh`: show keybind hints

## tools

- **yazi**: modern terminal file manager
- **waypaper**: GUI wallpaper manager (run `waypaper`)
- **songfetch**: display current song with album art

## keybinds

**modifier**: `super` (windows key)

### applications
- `super + return`: open terminal
- `super + shift + return`: floating terminal
- `super + e`: file manager (thunar)
- `super + shift + e`: terminal file manager (yazi)
- `super + d`: app launcher (rofi)
- `super + f`: app launcher (duplicate)
- `super + b`: open browser
- `super + l`: lock screen
- `super + r`: restart waybar
- `super + c`: color picker

### window management
- `super + q`: close window
- `super + shift + q`: force close window
- `super + shift + f`: fullscreen
- `super + space`: toggle floating
- `super + p`: toggle pseudo-tile
- `super + j`: toggle split

### window focus
- `super + ←/→/↑/↓`: move focus
- `super + ctrl + ←/→/↑/↓`: move window
- `super + shift + ←/→/↑/↓`: resize window

### workspaces
- `super + 1-9/0`: switch workspace
- `super + shift + 1-9/0`: move window to workspace
- `super + scroll`: cycle workspaces

### tools & scripts
- `super + v`: clipboard manager
- `super + period`: emoji picker
- `super + h`: keybind hints
- `super + w`: wallpaper selector
- `super + shift + w`: random wallpaper
- `super + ctrl + b`: waybar styles
- `super + alt + b`: waybar layout

### media controls
- `volume up/down`: adjust volume
- `mute`: toggle mute
- `mic mute`: toggle mic mute
- `brightness up/down`: adjust brightness
- `play/pause/next/prev`: media controls

### mouse
- `super + left click`: move window
- `super + right click`: resize window

## customization

**wallpapers**
put images in `~/Pictures/Wallpapers/`. supports jpg, png, gif, webp.

**themes**
colors generated automatically from wallpaper using matugen.

**colors**
generated by matugen from `~/.config/hypr/current_wallpaper`.
customize at `~/.config/matugen/config.toml`.

## troubleshooting

**wallpaper not changing**
```bash
pkill swww
swww-daemon
```

**colors not applying**
```bash
matugen image --type scheme-vibrant ~/.config/hypr/current_wallpaper
```

**waybar broken**
```bash
pkill waybar
waybar
```

## backup

installer backs up to `~/dotfiles-backup-YYYYMMDD-HHMMSS/`.

## license & credits

author: microck.
license: free to use.
credits: arch community.
