#!/bin/bash

# Display the power menu using rofi
OPTIONS="Shutdown\nReboot\nLogout"
CHOSEN=$(echo -e $OPTIONS | rofi -dmenu -i -p "Power Menu")

# Execute the chosen command
case "$CHOSEN" in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Logout)
        i3-msg exit
        ;;
    *)
        exit 1
        ;;
esac
