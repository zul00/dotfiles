#!/bin/bash
display=`xrandr | grep -w connected | egrep -v LVDS | egrep -o '[A-Z]{3,}-[1-4]{1}'`
echo $display
if [[ -z "$display" ]]; then
    ~/scripts/display/display.sh "empty" $1
else
    ~/scripts/display/display.sh $display $1
fi
