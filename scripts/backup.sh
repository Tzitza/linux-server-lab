#!/bin/bash
# backup.sh - Create a timestamped compressed backup and keep only the newest 5

source_dir="$1"
backup_dir="$HOME/backups"
keep=5

if [ -z "$source_dir" ]; then
    echo "Usage: $0 <directory-to-backup>"
    exit 1
fi

if [ ! -d "$source_dir" ]; then
    echo "ERROR: $source_dir is not a directory"
    exit 2
fi

mkdir -p "$backup_dir"

timestamp=$(date +%Y-%m-%d_%H-%M-%S)
name=$(basename "$source_dir")
archive="$backup_dir/${name}_${timestamp}.tar.gz"

if tar -czf "$archive" -C "$(dirname "$source_dir")" "$name"; then
    echo "Backup created: $archive"
    ls -lh "$archive"
else
    echo "ERROR: backup failed"
    exit 3
fi

# Rotation: delete all but the newest $keep backups of this directory
ls -t "$backup_dir"/"${name}"_*.tar.gz | tail -n +$((keep + 1)) | while read -r old; do
    echo "Removing old backup: $old"
    rm -- "$old"
done
