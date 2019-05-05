#!/bin/bash

device=`xinput list | grep TouchPad | egrep -o 'id=[0-9]?{3}' |\
    egrep -o "[0-9]?{3}"`
state=`xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$"`

if [ $state == '1' ];then
    xinput --disable $device && notify-send "Touchpad disabled" -u low
else
    xinput --enable $device && notify-send "Touchpad enabled" -u low
fi
