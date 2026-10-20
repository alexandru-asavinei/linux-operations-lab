#!/usr/bin/env bash

set -eu

section() {
    printf '\n=== %s ===\n' "$1"
}

section "SYSTEM"
uname -s
uname -m

section "HOSTNAME"
if command -v hostname >/dev/null 2>&1; then
    hostname
else
    printf 'hostname command unavailable\n'
fi

section "UPTIME"
uptime

section "FILESYSTEM"
df -h .

section "REPORT STATUS"
printf 'System report completed.\n'
