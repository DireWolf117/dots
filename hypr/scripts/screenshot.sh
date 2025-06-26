#!/bin/bash

# Screenshot script for Hyprland using grim and slurp
# Requires: grim, slurp, wl-clipboard, jq, notify-send

SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
FILENAME="screenshot_$TIMESTAMP.png"
FILEPATH="$SCREENSHOTS_DIR/$FILENAME"

# Create screenshots directory if it doesn't exist
mkdir -p "$SCREENSHOTS_DIR"

case "$1" in
    "--area")
        # Select area and take screenshot
        grim -g "$(slurp)" "$FILEPATH" && 
        wl-copy < "$FILEPATH" &&
        notify-send "Screenshot" "Area screenshot saved to $FILEPATH" -i "$FILEPATH"
        ;;
    "--full")
        # Take full screenshot
        grim "$FILEPATH" && 
        wl-copy < "$FILEPATH" &&
        notify-send "Screenshot" "Full screenshot saved to $FILEPATH" -i "$FILEPATH"
        ;;
    "--window")
        # Get active window geometry and take screenshot
        ACTIVE_WINDOW=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
        grim -g "$ACTIVE_WINDOW" "$FILEPATH" && 
        wl-copy < "$FILEPATH" &&
        notify-send "Screenshot" "Window screenshot saved to $FILEPATH" -i "$FILEPATH"
        ;;
    *)
        # Default to area screenshot if no argument is provided
        grim -g "$(slurp)" "$FILEPATH" && 
        wl-copy < "$FILEPATH" &&
        notify-send "Screenshot" "Area screenshot saved to $FILEPATH" -i "$FILEPATH"
        ;;
esac
