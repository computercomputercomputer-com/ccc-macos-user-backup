# Computer Computer Computer - Simple User Backup Scripts

Free backup scripts for **Windows** and **macOS** designed to help safely back up a user's data before a reinstall, migration or hardware replacement.

🌐 **Website:** https://computercomputercomputer.com

---

## Overview

These scripts are designed to be simple enough for home users while still being useful for IT engineers and MSPs.

They automatically back up the current user's files to an external drive and avoid copying unnecessary cache and temporary files.

Both scripts support restarting. If the backup is interrupted, simply run the script again. Only new or changed files will be copied.

---

# Included Scripts

| Script                     | Operating System |
| -------------------------- | ---------------- |
| | `ccc-macos-user-backup.sh` | macOS            |

---

# Features

* Automatically detects an external USB drive
* Allows you to choose another destination if required
* Creates a structured backup folder
* Includes OneDrive, Dropbox and Google Drive (Windows)
* Includes iCloud Drive (macOS)
* Skips common cache and temporary files
* Creates a backup log
* Creates a backup summary
* Can be cancelled with **CTRL+C**
* Can safely be run again later
* Copies only new or changed files

---

# Windows

The Windows script uses **Robocopy**, Microsoft's built-in file copy utility.

### Backs up

* Desktop
* Documents
* Downloads
* Pictures
* Videos
* Music
* OneDrive
* Dropbox
* Google Drive
* Project folders
* Other user-created files

### Skips

* Temporary files
* Browser cache
* Windows cache
* Crash dumps
* Log files
* Thumbnails
* Recycle Bin
* Application cache folders

---

# macOS

The macOS script uses **rsync**.

### Backs up

* Desktop
* Documents
* Downloads
* Pictures
* Movies
* Music
* iCloud Drive
* Project folders
* Other user-created files

### Skips

* Cache folders
* Browser cache
* Temporary files
* Log files
* Trash
* Application cache folders

---

# Progress

During the backup the scripts display information including:

* Current file being copied
* Transfer speed
* Data copied
* Estimated time remaining (where supported by the operating system)

Large backups can take several hours depending on the amount of data and the speed of the destination drive.

---

# Running the Windows Script

1. Download `ccc-user-backup.bat`
2. Plug in an external drive.
3. Right-click the script.
4. Select **Run as administrator**.
5. The script will attempt to detect the backup drive automatically.
6. Press **Enter** to use the detected drive or choose another.
7. Wait for the backup to finish.
8. Verify your files before wiping or reinstalling the computer.

---

# Running the macOS Script

Open Terminal.

Make the script executable.

```bash
chmod +x ccc-macos-user-backup.sh
```

Run it.

```bash
./ccc-macos-user-backup.sh
```

The script will detect available external drives and guide you through the backup.

---

# Before Wiping Any Device

**Do not wipe, reset or reinstall a device until you have verified the backup.**

Check the following:

* Documents
* Desktop
* Downloads
* Pictures
* Videos or Movies
* Music
* OneDrive, Dropbox, Google Drive or iCloud Drive (if used)
* Business or project folders

Open several files to confirm they are readable.

A backup is only a backup once you have confirmed your files are present.

---

# Logs

Both scripts create:

* Backup log
* Backup summary

These can be used to troubleshoot any issues.

---

# Disclaimer

These scripts are provided free of charge without warranty.

Always verify your backup before deleting, wiping or reinstalling any device.

---

# Contributing

Suggestions and improvements are always welcome.

Feel free to submit an issue or pull request.

---

# About Computer Computer Computer

Computer Computer Computer provides IT support, cyber security, Microsoft 365, cloud migrations, backup solutions and managed IT services for businesses across the UK.

🌐 https://computercomputercomputer.com

If you found these scripts useful, please consider giving the repository a ⭐.
