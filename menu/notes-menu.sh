#!/bin/bash

CHOICE=$(~/.config/menu/lib/menu.sh -c -l 3 << END
index
journal
search
END
) || exit 1

case $CHOICE in
  "index")
    kitty nvim -c 'cd ~/Notes' ~/Notes/index.md
    ;;
  "journal")
    kitty nvim -c 'Telekasten goto_today' -c 'cd ~/Notes'
    ;;
  "search")
    kitty nvim -c 'Telekasten find_notes' -c 'cd ~/Notes'
esac
  
