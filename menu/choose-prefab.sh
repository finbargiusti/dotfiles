#!/bin/sh

SCRIPT=$(
  find $HOME/.config/menu -maxdepth 1 -type f | \
  xargs -n 1 basename | \
  grep -v choose-script.sh | \
  cut -d'.' -f1 | \
  $HOME/.config/menu/lib/menu.sh -p 'Choose script:' -i -c -l 7
) || exit 1

if [ -z "$SCRIPT" ]; then
  exit 1
fi

~/.config/menu/$SCRIPT.sh
