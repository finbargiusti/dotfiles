#!/bin/bash

CHOICE=$(~/.config/scripts/lib/menu.sh -c -l 3 << END
Index
Journal
END
) || exit 1

case $CHOICE in
  "Index")
    kitty nvim ~/Notes/index.md
    ;;
  "Journal")
    kitty nvim -c 'Telekasten goto_today'
    ;;
esac
  
