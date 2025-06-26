#!/bin/bash

# Kill already running processes
killall -q waybar
killall -q hyprpaper

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done
while pgrep -x hyprpaper >/dev/null; do sleep 1; done

# Launch hyprpaper
hyprpaper &

# Launch waybar
waybar &

# Set initial workspace to 5
hyprctl dispatch workspace 5
