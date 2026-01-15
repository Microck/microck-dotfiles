# Ly Login Manager Configuration

Arch Linux with Hyprland session manager.

## Overview

This configuration uses Ly as a display/login manager with Hyprland as the default session.

## Configuration Files

- `config.ini` - Main Ly configuration
- `save.ini` - Saved session data (auto-saves last session)

## Current Settings

### Session
- **Default session**: Hyprland
- **Default input**: login
- **Language**: English

### Appearance
- **Background**: Black (0x00000000)
- **Animation**: None
- **Borders**: Enabled (white)
- **Info text**: Hostname

### Password
- **Allow empty**: true
- **Mask char**: * (asterisk)
- **Failed attempts**: 10 (before special animation)

### Function Keys
- **F1**: Shutdown
- **F2**: Restart
- **F3**: Sleep
- **F5**: Brightness down
- **F6**: Brightness up

## Sessions Available

- **Hyprland**: Default Wayland compositor
- **Hyprland (UWSM)**: With Waybar/UWSM session

## Installation (Manual)

Since Ly is a system-level service, copy these configs manually:

```bash
# Backup current config
sudo cp /etc/ly/config.ini /etc/ly/config.ini.backup

# Apply new config
sudo cp config.ini /etc/ly/config.ini

# Restart Ly service
sudo systemctl restart ly
```

## Location

System-level configuration: `/etc/ly/`
Saved sessions: `/etc/ly/save.ini`
Desktop sessions: `/usr/share/wayland-sessions/`

---

## Note: Minecraft Theme is in GRUB

The Minecraft theme is applied to **GRUB** (the bootloader), not Ly. See `../grub/README.md` for GRUB Minecraft theme configuration.
