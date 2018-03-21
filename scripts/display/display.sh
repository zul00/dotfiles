#!/bin/sh

EXT_DISP=`xrandr | awk '/ connected/ {print $0}' | awk '!/LVDS/ {print $1}'`

if [ $1 = "right" ]; then
    xrandr --output $EXT_DISP --right-of LVDS1 --auto --rotate normal
elif [ $1 = "left" ]; then
    xrandr --output $EXT_DISP --left-of LVDS1 --auto --rotate normal
elif [ $1 = "above" ]; then
    xrandr --output $EXT_DISP --above LVDS1 --auto --rotate normal
elif [ $1 = "below" ]; then
    xrandr --output $EXT_DISP --below LVDS1 --auto --rotate normal
elif [ $1 = "same" ]; then
    xrandr --output $EXT_DISP --same-as LVDS1 --auto --rotate normal
elif [ $1 = "off" ]; then
    EXT_DISP=`xrandr | awk '/+/ {print $0}' | awk '/mm/ {print $0}' | awk '!/LVDS/ {print $1}'`
    display=`xrandr | grep connected | grep -v LVDS | grep mm | egrep -o '[A-Z]{4,}-[1-4]{1}'`
    xrandr --output $EXT_DISP --off --output LVDS1 --auto
fi&

if [ $1 = "off" ]; then
    pacmd set-card-profile 0 "output:analog-stereo+input:analog-stereo"
else
    pacmd set-card-profile 0 "output:hdmi-stereo+input:analog-stereo"
fi;
