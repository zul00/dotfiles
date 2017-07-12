#!/bin/sh
if [ $2 = "right" ]; then
    xrandr --output $1 --right-of LVDS-1 --rotate normal
elif [ $2 = "left" ]; then
    xrandr --output $1 --left-of LVDS-1 --rotate normal
elif [ $2 = "above" ]; then
    xrandr --output $1 --above LVDS-1 --rotate normal
elif [ $2 = "below" ]; then
    xrandr --output $1 --below LVDS-1 --rotate normal
else
    xrandr --output $1 --same-as LVDS-1 --rotate normal
fi;
