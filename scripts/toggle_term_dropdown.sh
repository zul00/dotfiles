#!/bin/bash

# This script will toggle a dropdown terminal. The tmux session is kept so when dropdown is
# reopened the session will be reattached

title="term_dropdown"

if [ `pgrep -f -d, "\<${title}\>"` ];
then
    pkill -f "\<${title}\>"
else
    # TODO: Look into assigning TERMINAL as env of profile
    alacritty -t ${title} -e tmux new-session -A -s dropdown &
fi
