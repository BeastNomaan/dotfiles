#!/usr/bin/env bash

# Names of your bars (change 'main' if your bar is named differently)
BAR_NAME="main"

bspc subscribe node_state | while read -r _ _ _ _ state status; do
    if [ "$state" = "fullscreen" ]; then
        if [ "$status" = "on" ]; then
            polybar-msg -p "$(pgrep -f "polybar $BAR_NAME")" cmd hide
        else
            polybar-msg -p "$(pgrep -f "polybar $BAR_NAME")" cmd show
        fi
    fi
done
