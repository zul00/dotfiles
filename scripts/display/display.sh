#!/bin/sh
xrandr \
    --output LVDS-1 --primary --mode 1600x900 --pos 1920x0 --rotate normal \
    --output $1 --mode 1920x1080 --pos 0x0 --rotate normal
