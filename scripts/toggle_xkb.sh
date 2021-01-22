#!/bin/bash

setting=$(setxkbmap -query | egrep -o 'layout.*$' | egrep -o ': .*' | egrep -o '[a-z]*')

if [ "$setting" != 'us' ];then
	notify-send "us"
	setxkbmap -layout us
else
	notify-send "ara"
	setxkbmap -layout ara -variant buckwalter
fi
