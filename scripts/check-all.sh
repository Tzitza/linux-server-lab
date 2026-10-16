#!/bin/bash
# check-all.sh - Check several services and report failures

services="ssh cron systemd-journald"
failed=0

for s in $services; do
    if systemctl is-active --quiet "$s"; then
        echo "[ OK ] $s"
    else
        echo "[FAIL] $s"
        failed=$((failed + 1))
    fi
done

echo "Failed: $failed"

if [ "$failed" -eq 0 ]; then
    exit 0
else
    exit 1
fi
