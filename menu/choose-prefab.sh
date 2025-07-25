#!/bin/sh

PREFABS_DIR="$HOME/.config/prefabs/"
MENU="$HOME/.config/menu/lib/menu.sh"

OPTS=$(
    find $PREFABS_DIR -maxdepth 1 -type f | \
    xargs -I {} basename {} 
)

LEN=$(wc -l <<< $OPTS)
LEN=$(( $LEN > 8 ? 8 : $LEN ))

SCRIPT=$(
  $MENU -p 'Choose prefab:' -i -c -l $LEN <<< $OPTS
) || exit 1

if [ -z "$PREFABS_DIR$SCRIPT" ]; then
  exit 1
fi

$PREFABS_DIR$SCRIPT
