#!/bin/bash

# Function to get the volume percentage
get_volume() {
    amixer -D pulse sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }' | sed 's/%//'
}

# Function to adjust the volume
adjust_volume() {
    case $1 in
        up)
            amixer -D pulse sset Master 5%+ > /dev/null
            ;;
        down)
            amixer -D pulse sset Master 5%- > /dev/null
            ;;
    esac
}

# Get current volume percentage
volume=$(get_volume)

# Check for scroll event to adjust volume
case $BLOCK_BUTTON in
    4) # Scroll up
        adjust_volume up
        ;;
    5) # Scroll down
        adjust_volume down
        ;;
esac

# Output volume percentage
echo "$volume%"
