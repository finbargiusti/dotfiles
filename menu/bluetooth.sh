#!/bin/sh

mac() {
  sed -nE 's/^Device\s+([[:alnum:]\:]+)\s+.*/\1/p'
}

name() {
  sed -nE 's/^Device\s+[[:alnum:]\:]+\s+(.+)/\1/p'
}

ALL_DEVICES=$(bluetoothctl devices Paired)
CONNECTED_DEVICES=$(bluetoothctl devices Connected)

DEVICE_COUNT=$(wc -l <<< "$ALL_DEVICES")

if [ "$DEVICE_COUNT" -eq 0 ]; then
  notify-send "No Bluetooth devices found"
  exit 1
fi

IDS=$(mac <<< "$ALL_DEVICES")
NAMES=$(name <<< "$ALL_DEVICES")

MENU_ITEMS=$(
  while read -r name; do
    if echo "$CONNECTED_DEVICES" | grep -q "$name"; then
      echo "$name [DISCONNECT]"
    else
      echo "$name    [CONNECT]"
    fi
  done <<< "$NAMES" | xargs
)

SELECTION=$(
  ~/.config/menu/lib/menu.sh -c -l 8 -p "Select Bluetooth device" -w 100 <<< "$MENU_ITEMS" 
) || exit 1

# this is fine as i expect no duplicates. Too bad!
INDEX=$(
  printf "%s\n" "$MENU_ITEMS" | grep -nF "$SELECTION" | head -n 1 | cut -d: -f1
)

ID=$(
  sed "${INDEX}q;d" <<< "$IDS"
)

if grep -qF "[CONNECT]" <<< "$SELECTION"; then
  notify-send "$SELECTION"
  bluetoothctl connect "$ID" && notify-send "success" || notify-send "Failed to connect to $SELECTION"
else
  notify-send "$SELECTION"
  bluetoothctl disconnect "$ID" && notify-send "success" || notify-send "Failed to disconnect from $SELECTION"
fi
