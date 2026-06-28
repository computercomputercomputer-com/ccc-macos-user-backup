#!/bin/bash

clear

echo "====================================================="
echo "       Computer Computer Computer - macOS Backup"
echo "====================================================="
echo
echo "Website: https://computercomputercomputer.com"
echo
echo "This script backs up the current macOS user's files."
echo
echo "You can press CTRL+C to cancel."
echo "You can run it again later."
echo "Only new or changed files will be copied."
echo

SOURCE="/Users/$USER"

echo "Detecting external drives..."
echo

VOLUMES=()
while IFS= read -r volume; do
    if [[ "$volume" != "/Volumes/Macintosh HD" ]]; then
        VOLUMES+=("$volume")
    fi
done < <(find /Volumes -maxdepth 1 -mindepth 1 -type d)

if [ ${#VOLUMES[@]} -eq 0 ]; then
    echo "No external drive detected."
    echo
    read -p "Enter backup path, example /Volumes/BackupDrive: " DEST
else
    echo "Detected drives:"
    echo
    for i in "${!VOLUMES[@]}"; do
        echo "$((i+1))) ${VOLUMES[$i]}"
    done
    echo
    read -p "Press ENTER to use option 1, or type another number/path: " CHOICE

    if [ -z "$CHOICE" ]; then
        DEST="${VOLUMES[0]}"
    elif [[ "$CHOICE" =~ ^[0-9]+$ ]]; then
        DEST="${VOLUMES[$((CHOICE-1))]}"
    else
        DEST="$CHOICE"
    fi
fi

if [ ! -d "$DEST" ]; then
    echo
    echo "ERROR: Destination not found:"
    echo "$DEST"
    exit 1
fi

BACKUP="$DEST/CCC-Backups/$(hostname)/$USER"
LOG="$BACKUP/backup-log.txt"
REPORT="$BACKUP/backup-summary.txt"

mkdir -p "$BACKUP"

echo
echo "Estimating user data size..."
echo "This may take a few minutes on large machines."
echo

du -sh "$SOURCE" 2>/dev/null

echo
echo "Backup destination:"
echo "$BACKUP"
echo
echo "IMPORTANT:"
echo "Do not wipe or reinstall this Mac until you have checked the backup."
echo
read -p "Press ENTER to start backup..."

echo "Backup started: $(date)" > "$REPORT"
echo "Computer: $(hostname)" >> "$REPORT"
echo "User: $USER" >> "$REPORT"
echo "Source: $SOURCE" >> "$REPORT"
echo "Destination: $BACKUP" >> "$REPORT"
echo >> "$REPORT"

echo
echo "====================================================="
echo "Starting backup..."
echo "rsync will show files as they are copied."
echo "This may take several minutes or several hours."
echo "====================================================="
echo

rsync -avh --progress \
--exclude "Library/Caches/" \
--exclude "Library/Logs/" \
--exclude "Library/Safari/LocalStorage/" \
--exclude "Library/Application Support/Google/Chrome/Default/Cache/" \
--exclude "Library/Application Support/Google/Chrome/Default/Code Cache/" \
--exclude "Library/Application Support/Firefox/Profiles/*/cache2/" \
--exclude "Library/Containers/*/Data/Library/Caches/" \
--exclude ".Trash/" \
--exclude ".cache/" \
--exclude "*.tmp" \
--exclude "*.temp" \
--exclude "*.log" \
"$SOURCE/" "$BACKUP/" | tee -a "$LOG"

RC=${PIPESTATUS[0]}

echo >> "$REPORT"
echo "Backup finished: $(date)" >> "$REPORT"
echo "rsync exit code: $RC" >> "$REPORT"

echo
echo "====================================================="
echo "BACKUP FINISHED"
echo "====================================================="
echo
echo "Before wiping or reinstalling this Mac:"
echo
echo "[ ] Check Desktop"
echo "[ ] Check Documents"
echo "[ ] Check Downloads"
echo "[ ] Check Pictures"
echo "[ ] Check Movies"
echo "[ ] Check Music"
echo "[ ] Check iCloud Drive if used"
echo "[ ] Open several files to confirm they work"
echo
echo "Backup location:"
echo "$BACKUP"
echo
echo "Log file:"
echo "$LOG"
echo
echo "Only wipe the Mac once you have checked the backup."
echo
read -p "Press ENTER to exit..."
