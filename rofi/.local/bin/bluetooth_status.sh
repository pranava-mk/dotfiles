#!/usr/bin/env bash

# case $BLOCK_BUTTON in
#     1) ~/.local/bin/rofi-bluetooth/rofi-bluetooth ;;  # Left click
# esac

# Check if Bluetooth is powered on
if bluetoothctl show | grep -q "Powered: yes"; then
    # Check if any devices are connected
    if bluetoothctl info | grep -q "Connected: yes"; then
        # Bluetooth is on and connected
        echo -e "\uf294"  #  (Nerd Font Bluetooth icon)
        echo -e "\uf294"  #  (icon for click)
        echo "#81A1C1"    # Color when connected
    else
        # Bluetooth is on but no devices are connected
        echo -e "\uf294"  #  (Nerd Font Bluetooth icon)
        echo -e "\uf294"  #  (icon for click)
        echo "#fc9dc6"    # Color when on but disconnected
    fi
else
    # Bluetooth is off
    echo -e "\uf294"  #  (Nerd Font Bluetooth icon)
    echo -e "\uf294"  #  (icon for click)
    echo "#FFFFFF"    # Color when off
fi
