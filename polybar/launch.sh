#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar main 2>&1 | tee -a /tmp/polybar.log &

if [[ $(xrandr -q | grep 'eDP-1 connected') ]]; then
    polybar laptop &
fi

if [[ $(xrandr -q | grep 'DisplayPort-0 connected') ]]; then
    polybar desktop-main &
fi

if [[ $(xrandr -q | grep 'HDMI-A-0 connected') ]]; then
    polybar desktop-right &
fi

disown

echo "Polybar launched..."
