#!/bin/bash
set -euo pipefail

# 1. Path Correction: Standard Firefox uses ~/.mozilla/firefox
FIREFOX_DIR="$HOME/.mozilla/firefox"

# 2. Safety: If Firefox isn't installed yet or hasn't run, force profile creation
if [ ! -d "$FIREFOX_DIR" ]; then
    echo "Initializing Firefox profile..."
    timeout 5s firefox --headless > /dev/null 2>&1 || true
fi

# 3. Iterate through profiles
# We use the correct path and check for existence
for PROFILE in "$FIREFOX_DIR"/*.default-release "$FIREFOX_DIR"/*.default; do
    if [ -d "$PROFILE" ]; then
        echo "Installing LittleFox theme to: $(basename "$PROFILE")"
        
        # Create chrome folder
        mkdir -p "$PROFILE/chrome"
        
        # Use a unique temp dir to avoid conflicts
        TEMP_THEME=$(mktemp -d)
        git clone --depth=1 https://github.com/biglavis/LittleFox "$TEMP_THEME"
        
        # Copy the CSS
        cp "$TEMP_THEME/userChrome.css" "$PROFILE/chrome/"
        
        # Enable the theme via user.js (cleaner than appending to prefs.js)
        # Using grep ensures we don't add the same line every time you run this
        touch "$PROFILE/user.js"
        if ! grep -q "toolkit.legacyUserProfileCustomizations.stylesheets" "$PROFILE/user.js"; then
            echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> "$PROFILE/user.js"
        fi

        # Cleanup temp dir
        rm -rf "$TEMP_THEME"
    fi
done

echo "Firefox theme installation complete!"

