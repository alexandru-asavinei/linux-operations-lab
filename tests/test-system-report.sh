#!/usr/bin/env bash

set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
SCRIPT="$ROOT_DIR/scripts/system-report.sh"

if [ ! -f "$SCRIPT" ]; then
    printf 'FAIL: system report script not found\n' >&2
    exit 1
fi

OUTPUT="$(bash "$SCRIPT")"

for expected in \
    "=== SYSTEM ===" \
    "=== HOSTNAME ===" \
    "=== UPTIME ===" \
    "=== FILESYSTEM ===" \
    "=== REPORT STATUS ===" \
    "System report completed."
do
    case "$OUTPUT" in
        *"$expected"*) ;;
        *)
            printf 'FAIL: missing expected output: %s\n' "$expected" >&2
            exit 1
            ;;
    esac
done

TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TEMP_DIR"' EXIT

cat > "$TEMP_DIR/uname" <<'MOCK'
#!/bin/sh
exit 42
MOCK

chmod +x "$TEMP_DIR/uname"

if PATH="$TEMP_DIR:$PATH" bash "$SCRIPT" >/dev/null 2>&1; then
    printf 'FAIL: script should stop when uname fails\n' >&2
    exit 1
fi

printf 'PASS: expected report sections are present.\n'
printf 'PASS: script fails when uname fails.\n'
