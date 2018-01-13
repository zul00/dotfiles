#!/bin/bash
# source: https://www.reddit.com/r/unixporn/comments/3358vu/i3lock_unixpornworthy_lock_screen/
# icon source: https://www.iconfinder.com/search/?q=lock&amp;price=premium&amp;license=2
ICON=$HOME/scripts/lockscreen/icon/1483940564_lock_locked.png
IMAGE=/tmp/screen.png
XOFF=`xrandr | awk -F+ '/primary/{print $2}'`
MAINDISP_W=`xrandr | awk '/primary/{print $4}' | awk -Fx '{print $1}'`
MAINDISP_H=`xrandr | awk '/primary/{print $4}' | awk -Fx '{print $2}' | awk -F+ '{print $1}'`

# Generate Lockscreen
scrot $IMAGE
ffmpeg  -loglevel quiet \
        -i $IMAGE \
        -i $ICON \
        -filter_complex "boxblur=10,overlay=($MAINDISP_W-overlay_w)/2+$XOFF:($MAINDISP_H-overlay_h)/2" -vframes 1 -y $IMAGE

# Lock screen
playerctl pause
param=( --textcolor=ffffff00 --insidecolor=e8dcd000 --ringcolor=e8dcd088 --linecolor=2d283e00 --keyhlcolor=e8dcd0ff --ringvercolor=E9A66Cff --separatorcolor=22222200 --insidevercolor=fadd5c00 --ringwrongcolor=CE325Bff --insidewrongcolor=f1345900 --clock)
i3lock "${param[@]}" -i $IMAGE -n &
