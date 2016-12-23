#!/bin/bash
exec urxvt -title "taskwarrior" -e zsh -c 'task;tasksh' &
exec urxvt -title "tty-clock" -e zsh -c 'tty-clock -c -s' &
exec urxvt -title "logo" -e zsh -c 'task logo;task calendar;zsh' &
