#!/usr/bin/env bash

source "$HOME/.config/fzf/themes/catppuccin-fzf-mocha.sh"

open_project() {
  set -e

  PROJECTS=$(find ~/workspace/* -maxdepth 0 -type d)
  if [ -z "$PROJECTS" ]; then
    notify-send "No Projects" "No projects found in ~/workspace"
    exit 1
  fi

  # Show only the basename of directories in rofi for cleaner display
  PROJECT_NAMES=$(echo "$PROJECTS" | xargs -n1 basename)
  SELECTED_NAME=$(echo "$PROJECT_NAMES" | fzf)

  if [ -z "$SELECTED_NAME" ]; then
    exit 0
  fi

  SELECTED_PATH=$(echo "$PROJECTS" | grep "/$SELECTED_NAME$")

  cd "$SELECTED_PATH"
  exec nix develop -c "$SHELL"
}

export -f open_project
ghostty -e bash -c "open_project"
