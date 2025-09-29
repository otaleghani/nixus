#!/usr/bin/env bash

update_system() {
  sudo nixos-rebuild switch --flake ~/.config#default
  read -r -p "Press Enter to close..."
}

export -f update_system
ghostty -e bash -c "update_system"
