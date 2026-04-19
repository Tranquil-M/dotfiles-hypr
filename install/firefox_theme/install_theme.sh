#!/bin/bash
PROFILE_DIR=$(find ~/.mozilla/firefox/ -maxdepth 1 -name "*.default-release" | head -n 1)

FIREFOX_DIR="$HOME/.mozilla/firefox"

for PROFILE in "$FIREFOX_DIR"/*.default "$FIREFOX_DIR"/*.default-release; do
    if [ -d "$PROFILE" ]; then
        echo "Installing to: $(basename "$PROFILE")"
        
        mkdir -p "$PROFILE/chrome"
        
        git clone https://github.com/biglavis/LittleFox /tmp/LittleFox; cd /tmp/LittleFox

        cp userChrome.css "$PROFILE/chrome/"
        
        echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> "$PROFILE/user.js"
    fi
done

rm -rf /tmp/LittleFox
