#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch Polybar, using default config location ~/.config/polybar/config.ini
if [[ $(xrandr -q | grep 'eDP-1 connected') ]]; then
    polybar laptop 2>&1 | tee -a /tmp/polybar.log &
    if [[ $(xrandr -q | grep 'HDMI-1-0 connected') ]]; then
        polybar external 2>&1 | tee -a /tmp/polybar.log &
    fi
fi

if [[ $(xrandr -q | grep 'DisplayPort-0 connected') ]]; then
    polybar desktop-main 2>&1 | tee -a /tmp/polybar.log &
    if [[ $(xrandr -q | grep 'HDMI-A-0 connected') ]]; then
        polybar desktop-right 2>&1 | tee -a /tmp/polybar.log &
    fi
fi

disown

echo "Polybar launched..."
