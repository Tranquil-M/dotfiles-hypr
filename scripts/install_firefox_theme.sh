#!/bin/bash
set -euo pipefail

source "scripts/ui.sh"

info "Deploying firefox theme..."

FIREFOX_DIR="$HOME/.mozilla/firefox"

if [ ! -d "$FIREFOX_DIR" ]; then
    substep "Initializing Firefox profile..."
    timeout 5s firefox --headless > /dev/null 2>&1 || true
fi

for PROFILE in "$FIREFOX_DIR"/*.default-release "$FIREFOX_DIR"/*.default; do
    if [ -d "$PROFILE" ]; then
        substep "Installing LittleFox theme to: $(basename "$PROFILE")"
        
        mkdir -p "$PROFILE/chrome"
        
        TEMP_THEME=$(mktemp -d)
        echo ""
        git clone --depth=1 https://github.com/biglavis/LittleFox "$TEMP_THEME"
        echo ""

        substep "creating userChrome.css file"
        cp "$TEMP_THEME/userChrome.css" "$PROFILE/chrome/"
       
        substep "Creating user.js file"
        touch "$PROFILE/user.js"

        substep "Applying user.js configuration"
        if ! grep -q "toolkit.legacyUserProfileCustomizations.stylesheets" "$PROFILE/user.js"; then
            echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> "$PROFILE/user.js"
        fi

        substep cleanup
        rm -rf "$TEMP_THEME"
    fi
done

success "Firefox theme installation complete!"

