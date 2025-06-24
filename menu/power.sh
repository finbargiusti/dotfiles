#!/bin/sh

CHOICE=$(
  ~/.config/menu/lib/menu.sh -c -w 200 -l 4 << END
sleep
logout
shutdown
restart
END
) || exit 1

case $CHOICE in 
  "sleep")
    systemctl suspend && swaylock;;
  "logout")
    swaymsg exit;;
  "shutdown")
    systemctl poweroff;;
  "restart")
    systemctl reboot
esac
