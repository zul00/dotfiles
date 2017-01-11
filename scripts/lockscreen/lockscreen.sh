#!/bin/bash
# source: https://www.reddit.com/r/unixporn/comments/3358vu/i3lock_unixpornworthy_lock_screen/
# icon source: https://www.iconfinder.com/search/?q=lock&amp;price=premium&amp;license=2
ICON=$HOME/scripts/lockscreen/icon/1483940564_lock_locked.png
TMPBG=/tmp/screen.png
scrot /tmp/screen.png
convert $TMPBG -scale 10% -scale 1000% $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
i3lock -i $TMPBG
