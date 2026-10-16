#!/bin/bash

name="$1"

if [ -z "$name" ]; then
    echo "Usage: $0 <name>"
    exit 1
fi

echo "Hello, $name! Welcome to the lab."
