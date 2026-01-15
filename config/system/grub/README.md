# GRUB Bootloader Configuration

Arch Linux with Minecraft-themed GRUB bootloader (Pochita theme).

## Overview

This configuration uses GRUB2 as the bootloader with a Minecraft singleplayer world selection screen theme called "Pochita".

## Theme Details

**Theme Name**: Pochita (Minecraft-style)
**Location**: `/usr/share/grub/themes/Pochita/`
**Package**: `grub-minecraft-theme-git` (AUR)

### Theme Components

- **Background**: `background.png` (Minecraft grass background)
- **Logo**: `logo.png` (centered logo image)
- **Icons**: Custom Minecraft-style selection icons
- **Font**: Unifont Regular 16
- **Colors**:
  - Primary: `#4C4F69` (purple/blue)
  - Background: `#EFF1F5` (light purple)
  - Selected: `#4C4F69` (same as primary)
  - Text: White

### Theme Features

- **Desktop image**: Scaled to fit height
- **Boot menu**: 480px wide, 30% height
- **Countdown timer**: "Booting in %d seconds"
- **Selection highlights**: Custom selection cursors (select_c.png, select_e.png, select_w.png)

## GRUB Configuration

### Current Settings

**File**: `/etc/default/grub`

```bash
GRUB_DEFAULT=saved
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="Arch"
GRUB_TIMEOUT_STYLE=menu
```

- **Default entry**: Saved entry (remembers last choice)
- **Timeout**: 5 seconds
- **Distribution**: Arch Linux
- **Timeout style**: Menu (not countdown)

### Boot Options

- `loglevel=3 quiet` - Reduce boot messages
- `root=/dev/ArchinstallVg/root` - Root partition
- `zswap.enabled=0` - ZRAM swap disabled
- `rootfstype=ext4` - Filesystem type

## Installation (Manual)

Since GRUB is a system-level bootloader, updating configs requires root privileges:

```bash
# Backup current config
sudo cp /etc/default/grub /etc/default/grub.backup

# Apply new config
sudo cp grub-default.txt /etc/default/grub

# Update GRUB (required after config changes)
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## Theme Installation

The Pochita theme is installed from AUR:

```bash
# If theme needs to be reinstalled
yay -S grub-minecraft-theme-git
```

## Location

System-level configuration: `/etc/default/grub`
Generated bootloader config: `/boot/grub/grub.cfg`
Theme files: `/usr/share/grub/themes/Pochita/`
System-wide themes: `/usr/share/grub/themes/`

## Troubleshooting

### Theme not showing
```bash
# Set GRUB to use Pochita theme
echo "GRUB_THEME=/usr/share/grub/themes/Pochita/theme.txt" | sudo tee -a /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

### Default entry not working
```bash
# Reset to first entry
echo "GRUB_DEFAULT=0" | sudo tee /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
