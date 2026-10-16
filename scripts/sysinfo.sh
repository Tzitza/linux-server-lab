#!/bin/bash
# sysinfo.sh - Print basic system information

line="=================================="

echo "$line"
echo "         SYSTEM INFORMATION"
echo "$line"

echo "Hostname:  $(hostname)"
echo "User:      $(whoami)"
echo "Uptime:    $(uptime -p)"

echo ""
echo "--- Disk usage (/) ---"
df -h /

echo "$line"
