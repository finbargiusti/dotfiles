#!/bin/sh

PREFABS_DIR="$HOME/.config/prefabs/"
MENU="$HOME/.config/menu/lib/menu.sh"

SCRIPT=$(
  find $PREFABS_DIR -maxdepth 1 -type f | \
  xargs -I {} basename {} | \
  $MENU -p 'Choose prefab:' -i -c -l 7
) || exit 1

if [ -z "$PREFABS_DIR$SCRIPT" ]; then
  exit 1
fi

$PREFABS_DIR$SCRIPT
