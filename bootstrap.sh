#!/usr/bin/bash

# Hyprland
rm ~/.config/hypr
ln -s "$DOTFILES_LOCATION/hyprland" ~/.config/hypr

# Alacritty 
rm ~/.config/alacritty
ln -s "$DOTFILES_LOCATION/alacritty" ~/.config/alacritty

# Neovim
rm ~/.config/nvim
ln -s "$DOTFILES_LOCATION/nvim" ~/.config/nvim

rm ~/.config/lazygit
ln -s "$DOTFILES_LOCATION/lazygit" ~/.config/lazygit
