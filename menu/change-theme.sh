#!/bin/bash

THEME_DIR=~/.config/sway/themes

NEW_THEME=$(
  ls $THEME_DIR | \
  cut -d'.' -f1 | \
  ~/.config/menu/lib/menu.sh -c -l 3 -w 700 -p "Choose a theme" \
) || exit 1

ln -sf $THEME_DIR/$NEW_THEME.conf ~/.config/sway/theme.conf
ln -sf ~/.config/menu/lib/$NEW_THEME-menu.sh ~/.config/menu/lib/menu.sh

swaymsg reload
