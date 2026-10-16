#!/bin/bash
# report.sh - Generate a system health report

report_dir="$HOME/reports"
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
report="$report_dir/report_${timestamp}.txt"
services="ssh cron ufw fail2ban"
failed=0

mkdir -p "$report_dir"

{
    echo "===== SYSTEM HEALTH REPORT ====="
    echo "Generated: $(date)"
    echo "Host:      $(hostname)"
    echo "Uptime:    $(uptime -p)"
    echo ""

    echo "--- Disk usage (/) ---"
    df -h /
    echo ""

    echo "--- Memory ---"
    free -h
    echo ""

    echo "--- Services ---"
    for s in $services; do
        if systemctl is-active --quiet "$s"; then
            echo "[ OK ] $s"
        else
            echo "[FAIL] $s"
            failed=$((failed + 1))
        fi
    done
    echo ""

    echo "--- Listening TCP ports ---"
    ss -tln
    echo ""

    echo "--- Firewall ---"
    sudo -n ufw status 2>/dev/null || echo "(run with sudo to see firewall status)"
    echo ""

    echo "--- Last 5 logins ---"
    last -n 5
} > "$report"

echo "Report saved: $report"
cat "$report"
