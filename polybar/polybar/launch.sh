#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar main 2>&1 | tee -a /tmp/polybar.log &

if [[ $(xrandr -q | grep 'HDMI-1-0 connected') ]]; then
    polybar external &
fi

disown

echo "Polybar launched..."
