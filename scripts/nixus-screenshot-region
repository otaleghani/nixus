#!/usr/bin/env bash

# Needs wl-copy to function
# TODO: Copy path with action

CURRENT_TIMESTAMP=$(date +"%Y-%m-%d_%H%M%S")
FILENAME=screenshot_$CURRENT_TIMESTAMP.png
DIRECTORY=$HOME/screenshots/
SCREENSHOT_PATH=$DIRECTORY/$FILENAME

mkdir -p $DIRECTORY
grim -g "$(slurp)" $SCREENSHOT_PATH


if [ $? -eq 0 ]; then
  notify-send -a Screenshot "Capture saved" "You can find your screenshot at $SCREENSHOT_PATH." -i $SCREENSHOT_PATH
  # ACTION=$(notify-send -a Screenshot "Capture saved" "You can find your screenshot at $SCREENSHOT_PATH." -i $SCREENSHOT_PATH)
  # case "$ACTION" in
  #   "copy")
  #       echo "$SCREENSHOT_PATH" | wl-copy
  #       notify-send -a Screenshot "Path Copied" "$SCREENSHOT_PATH"
  #       ;;
  #   *)
  #       ;;
  # esac
else
  notify-send -a Screenshot -u critical "Capture failed" "Time to hunt down the bug..."
fi
