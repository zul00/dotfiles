#!/bin/sh
if [ $2 = "right" ]; then
    xrandr --output $1 --right-of LVDS-1 --auto --rotate normal
elif [ $2 = "left" ]; then
    xrandr --output $1 --left-of LVDS-1 --auto --rotate normal
elif [ $2 = "above" ]; then
    xrandr --output $1 --above LVDS-1 --auto --rotate normal
elif [ $2 = "below" ]; then
    xrandr --output $1 --below LVDS-1 --auto --rotate normal
elif [ $2 = "same" ]; then
    xrandr --output $1 --same-as LVDS-1 --auto --rotate normal
elif [ $2 = "off" ]; then
    display=`xrandr | grep connected | grep -v LVDS | grep mm | egrep -o '[A-Z]{4,}-[1-4]{1}'`
    xrandr --output $display --off
fi&

if [ $2 = "off" ]; then
    pacmd set-card-profile 0 "output:analog-stereo+input:analog-stereo"
else
    pacmd set-card-profile 0 "output:hdmi-stereo+input:analog-stereo"
fi;
