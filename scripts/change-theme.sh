#!/bin/bash

NEW_THEME=$1

ln -sf ~/.config/sway/themes/$NEW_THEME.conf ~/.config/sway/theme.conf

swaymsg reload
