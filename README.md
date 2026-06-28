# Computer Computer Computer - macOS User Backup Script

Free macOS backup script designed to help safely back up a user's data before a reinstall, migration or hardware replacement.

🌐 **Website:** https://computercomputercomputer.com

---

## Overview

This script is designed to be simple enough for home users while still being useful for IT engineers and MSPs.

It backs up the current macOS user's files to an external drive and avoids copying unnecessary cache and temporary files.

The script supports restarting. If the backup is interrupted, simply run the script again. Only new or changed files will be copied.

---

# Included Script

| Script | Operating System |
| ------ | ---------------- |
| `ccc-macos-user-backup.sh` | macOS |

---

# Features

* Automatically detects an external drive
* Allows you to choose another destination if required
* Creates a structured backup folder
* Includes iCloud Drive
* Skips common cache and temporary files
* Creates a backup log
* Creates a backup summary
* Can be cancelled with **CTRL+C**
* Can safely be run again later
* Copies only new or changed files

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

During the backup the script displays information including:

* Current file being copied
* Transfer speed
* Data copied
* Estimated time remaining where supported

Large backups can take several hours depending on the amount of data and the speed of the destination drive.

---

# Running the macOS Script

Open Terminal.

Make the script executable:

```bash
chmod +x ccc-macos-user-backup.sh
```

Run it:

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
* Movies
* Music
* iCloud Drive, if used
* Business or project folders

Open several files to confirm they are readable.

A backup is only a backup once you have confirmed your files are present.

---

# Logs

The script creates:

* Backup log
* Backup summary

These can be used to troubleshoot any issues.

---

# Disclaimer

This script is provided free of charge without warranty.

Always verify your backup before deleting, wiping or reinstalling any device.

---

# Contributing

Suggestions and improvements are always welcome.

Feel free to submit an issue or pull request.

---

# About Computer Computer Computer

Computer Computer Computer provides IT support, cyber security, Microsoft 365, cloud migrations, backup solutions and managed IT services for businesses across the UK.

🌐 https://computercomputercomputer.com

If you found this script useful, please consider giving the repository a ⭐.
