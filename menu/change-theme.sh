#!/bin/bash

THEME_DIR=~/.config/sway/themes
FONT="FiraCodeNerdFont Mono Bold 18 @wght=400" 

NEW_THEME=$(
  ls $THEME_DIR | \
  cut -d'.' -f1 | \
  ~/.config/scripts/lib/menu.sh -c -l 2 -w 700 -p "Choose a theme" \
) || exit 1

ln -sf $THEME_DIR/$NEW_THEME.conf ~/.config/sway/theme.conf

swaymsg reload
