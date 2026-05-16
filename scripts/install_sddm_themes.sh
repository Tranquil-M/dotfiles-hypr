#!/usr/bin/env bash
set -euo pipefail

source "scripts/ui.sh"

REPO_URL="https://github.com/Darkkal44/qylock.git"
TEMP_DIR="$(mktemp -d)"

cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

info "Preparing installation environment..."
substep "Created temporary directory:"
substep "${C_ACCENT}$TEMP_DIR${C_RESET}"
success "Environment ready"

info "Cloning qylock..."
echo ""

if git clone "$REPO_URL" "$TEMP_DIR/repo"; then
    echo ""
    substep "Repository cloned successfully"
    success "Download complete"
else
    echo ""
    error "Failed to clone repository"
    exit 1
fi

info "Launching setup script..."

cd "$TEMP_DIR/repo"

if [[ ! -f sddm.sh ]]; then
    error "sddm.sh not found in repository"
    exit 1
fi

chmod +x sddm.sh

substep "Executing installer..."

if ./sddm.sh; then
    exit 0
else
    exit 1
fi

