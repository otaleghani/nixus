#!/usr/bin/env bash

# A script to launch windows either in the special or current workspace

if [ "$#" -lt 2 ]; then
    notify-send "hello"
    echo "Usage: $0 <mode> <command...>"
    echo ""
    echo "Modes:"
    echo "  special <command...>"
    echo "  tile <command...>"
    exit 1
fi

LAUNCH_MODE="$1"
shift

case "$LAUNCH_MODE" in
    special)
        if [ "$#" -lt 1 ]; then
            echo "Usage for tile mode: $0 tile <command...>"
            exit 1
        fi
        COMMAND_TO_RUN="$@"
        hyprctl dispatch workspace special
        hyprctl dispatch exec "[tile] $COMMAND_TO_RUN"
        # Waits for the window to appear, then it sets it as tiled.
        # This is because in the case of webapps they are sharing the same chromium profile, which can lead to 
        # unpredictable behaviors.
        sleep 0.3
        hyprctl dispatch settiled
        ;;

    tile)
        if [ "$#" -lt 1 ]; then
            echo "Usage for tile mode: $0 tile <command...>"
            exit 1
        fi
        COMMAND_TO_RUN="$@"
        hyprctl dispatch exec "[tile] $COMMAND_TO_RUN"
        # Waits for the window to appear, then it sets it as tiled.
        # This is because in the case of webapps they are sharing the same chromium profile, which can lead to 
        # unpredictable behaviors.
        sleep 0.3
        hyprctl dispatch settiled
        ;;

    *)
        echo "Error: Invalid mode '$LAUNCH_MODE'. Use 'float' or 'tile'."
        exit 1
        ;;
esac
