#!/bin/bash
# source: https://www.reddit.com/r/unixporn/comments/3358vu/i3lock_unixpornworthy_lock_screen/
# icon source: https://www.iconfinder.com/search/?q=lock&amp;price=premium&amp;license=2
ICON=$HOME/scripts/lockscreen/icon/1483940564_lock_locked.png
TMPBG=/tmp/screen.png

param=( --textcolor=ffffff00 --insidecolor=e8dcd000 --ringcolor=e8dcd088 --linecolor=2d283e00 --keyhlcolor=e8dcd0ff --ringvercolor=E9A66Cff --separatorcolor=22222200 --insidevercolor=fadd5c00 --ringwrongcolor=CE325Bff --insidewrongcolor=f1345900 --clock --bar-indicator)

playerctl pause

scrot $TMPBG
ffmpeg  -loglevel quiet \
        -i $TMPBG \
        -filter_complex "boxblur=10" -vframes 1 -y $TMPBG

#convert $TMPBG -scale 10% -scale 1000% $TMPBG
#convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
i3lock "${param[@]}" -i $TMPBG -n &
