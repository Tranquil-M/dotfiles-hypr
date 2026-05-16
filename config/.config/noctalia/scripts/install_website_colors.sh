#!/bin/bash

FIREFOX_DIRS=(
    "$HOME/.mozilla/firefox"
    "$HOME/.config/mozilla/firefox"
)

TEMPLATE_DIR="$HOME/.config/noctalia/templates/websites"

for FIREFOX_DIR in "${FIREFOX_DIRS[@]}"; do
    [[ -d "$FIREFOX_DIR" ]] || continue

    COLORS_FILE="$FIREFOX_DIR/colors.css"

    for PROFILE in "$FIREFOX_DIR"/*; do
        [[ -d "$PROFILE" ]] || continue

        CHROME_DIR="$PROFILE/chrome"
        mkdir -p "$CHROME_DIR"

        if [[ -f "$COLORS_FILE" ]]; then
            cp "$COLORS_FILE" "$CHROME_DIR/colors.css"
        else
            echo "colors.css not found at $COLORS_FILE"
        fi

        WEBSITE_DIR="$CHROME_DIR/websites"

        if [[ -d "$TEMPLATE_DIR" ]]; then
            mkdir -p "$WEBSITE_DIR"
            rm -rf "$WEBSITE_DIR"/*
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
            [[ -f "$FILE" ]] || continue
            echo "@import url('file://$FILE');" >> "$USER_CONTENT_FILE"
        done

        echo "Processed profile: $PROFILE"
    done
done
