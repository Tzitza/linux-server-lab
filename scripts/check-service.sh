#!/bin/bash
# check-service.sh - Check whether a systemd service is running

service="$1"

if [ -z "$service" ]; then
    echo "Usage: $0 <service-name>"
    exit 1
fi

if systemctl is-active --quiet "$service"; then
    echo "OK: $service is running"
else
    echo "WARNING: $service is NOT running"
    exit 2
fi
