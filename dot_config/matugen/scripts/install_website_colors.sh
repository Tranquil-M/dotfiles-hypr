#!/bin/bash

FIREFOX_DIR="$HOME/.mozilla/firefox"
TEMPLATE_DIR="$HOME/.config/matugen/templates/websites"
COLORS_FILE="$FIREFOX_DIR/colors.css"  # Original colors.css location

if [[ ! -d "$FIREFOX_DIR" ]]; then
    echo "Firefox directory not found at $FIREFOX_DIR"
    exit 1
fi

for PROFILE in "$FIREFOX_DIR"/*; do
    if [[ -d "$PROFILE" ]]; then
        CHROME_DIR="$PROFILE/chrome"
        mkdir -p "$CHROME_DIR"

        if [[ -f "$COLORS_FILE" ]]; then
            cp "$COLORS_FILE" "$CHROME_DIR/colors.css"
        else
            echo "colors.css not found at $COLORS_FILE"
        fi

        WEBSITE_DIR="$CHROME_DIR/websites"
        if [[ -d "$TEMPLATE_DIR" ]]; then 
            if [[ -d "$WEBSITE_DIR" ]]; then
                rm -rf "$WEBSITE_DIR"/*
            else
                mkdir -p "$WEBSITE_DIR"
            fi
        
            cp -a "$TEMPLATE_DIR/." "$WEBSITE_DIR/"
        else
            echo "Template directory not found at $TEMPLATE_DIR"
            continue
        fi
        
        USER_CONTENT_FILE="$CHROME_DIR/userContent.css"
        > "$USER_CONTENT_FILE"

        if [[ -f "$CHROME_DIR/colors.css" ]]; then
            echo "@import url('file://$CHROME_DIR/colors.css');" >> "$USER_CONTENT_FILE"
        fi

        for FILE in "$WEBSITE_DIR"/*; do
            if [[ -f "$FILE" ]]; then
                echo "@import url('file://$FILE');" >> "$USER_CONTENT_FILE"
            fi
        done

    fi
done

