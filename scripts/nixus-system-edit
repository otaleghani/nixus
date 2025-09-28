#!/usr/bin/env bash

hyprctl dispatch workspace 11
hyprctl dispatch exec "ghostty --working-directory='$HOME/.config' --command=\"tmux new-session 'nvim hosts/default/configuration.nix'\""
sleep 0.3
nixus-launch-webapp tile "https://search.nixos.org/packages"
