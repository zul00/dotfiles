#!/bin/bash

device=`xinput list | grep TouchPad | egrep -o 'id=[0-9]?{3}' |\
    egrep -o "[0-9]?{3}"`
state=`xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$"`

if [ $state == '1' ];then
    xinput --disable $device
else
    xinput --enable $device
fi
