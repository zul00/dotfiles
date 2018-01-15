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
## Blur screen capture
ffmpeg  -loglevel quiet \
        -i $IMAGE \
        -i $ICON \
        -filter_complex "boxblur=10,overlay=($MAINDISP_W-overlay_w)/2+$XOFF:($MAINDISP_H-overlay_h)/2" -vframes 1 -y $IMAGE
## Added a box for clock and lock
ffmpeg  -i $IMAGE \
        -vf "drawbox=x=$XOFF+25:y=$MAINDISP_H-110:w=300:h=80:color=black@0.7:t=max" -y $IMAGE

# Pause media
playerctl pause
# Lock screen
letterEnteredColor=d23c3dff
letterRemovedColor=d23c3dff
passwordCorrect=00000000
passwordIncorrect=d23c3dff
background=00000000
foreground=ffffffff
i3lock \
		-t -n -i $IMAGE \
		--timepos="x-90:h-ch+30" \
		--datepos="tx+24:ty+25" \
		--clock --datestr "Type password to unlock..." \
		--insidecolor=$background --ringcolor=$foreground --line-uses-inside \
		--keyhlcolor=$letterEnteredColor --bshlcolor=$letterRemovedColor --separatorcolor=$background \
		--insidevercolor=$passwordCorrect --insidewrongcolor=$passwordIncorrect \
		--ringvercolor=$foreground --ringwrongcolor=$foreground --indpos="x+280:h-70" \
		--radius=20 --ring-width=4 --veriftext="" --wrongtext="" \
		--textcolor="$foreground" --timecolor="$foreground" --datecolor="$foreground" \
        --force-clock
