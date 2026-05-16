#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/Darkkal44/qylock.git"

TEMP_DIR="$(mktemp -d)"

echo "Created temp dir: $TEMP_DIR"

cleanup() {
    echo "Cleaning up..."
    rm -rf "$TEMP_DIR"
}

trap cleanup EXIT

git clone "$REPO_URL" "$TEMP_DIR/repo"

cd "$TEMP_DIR/repo"

chmod +x sddm.sh && ./sddm.sh

echo "Done."
