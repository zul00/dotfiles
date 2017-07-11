#!/bin/bash

display=`xrandr | grep -w connected | egrep -v LVDS | egrep -o '[A-Z]{4,}-[1-4]{1}'`

echo $display

~/.screenlayout/hdmi_left.sh
