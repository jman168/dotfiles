#!/usr/bin/bash

# Hyprland
rm ~/.config/hypr
ln -s "$DOTFILES_LOCATION/hyprland" ~/.config/hypr

# Alacritty 
rm ~/.config/alacritty
ln -s "$DOTFILES_LOCATION/alacritty" ~/.config/alacritty
