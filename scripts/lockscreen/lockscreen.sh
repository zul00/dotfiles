#!/bin/bash
# Ref: https://gist.github.com/Raymo111/91ffd256b7aca6a85e8a99d6331d3b7b
# Store this under /etc/systemd/system/wakelock@.service
# And enable it using 
# systemctl enable wakelock@zulkarnaen.service
#
# [Unit]
# Description=Lock the screen on resume from suspend
# Before=sleep.target suspend.target
# 
# [Service]
# User=%i
# Type=forking
# Environment=DISPLAY=:1
# ExecStart=/home/%i/bin/lockscreen/lockscreen.sh
# 
# [Install]
# WantedBy=sleep.target suspend.target

playerctl pause
pactl set-sink-mute @DEFAULT_SINK@ true && pkill -RTMIN+10 i3blocks

i3lock -c 111111 -f ...
