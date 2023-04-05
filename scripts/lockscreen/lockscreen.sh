#!/bin/bash
# Ref: https://gist.github.com/Raymo111/91ffd256b7aca6a85e8a99d6331d3b7b

playerctl pause
pactl set-sink-mute @DEFAULT_SINK@ true && pkill -RTMIN+10 i3blocks

i3lock -c 111111 -f ...
