#!/bin/sh

ACTIONS_DIR="$HOME/.config/actions/"
MENU="$HOME/.config/menu/lib/menu.sh"

OPTS=$(
    find $ACTIONS_DIR -maxdepth 1 -type f | \
    xargs -I {} basename {} 
)

LEN=$(wc -l <<< $OPTS)
LEN=$(( $LEN > 8 ? 8 : $LEN ))

SCRIPT=$(
  $MENU -p 'Choose action:' -i -c -l $LEN <<< $OPTS
) || exit 1

if [ -z "$ACTIONS_DIR$SCRIPT" ]; then
  exit 1
fi

$ACTIONS_DIR$SCRIPT
