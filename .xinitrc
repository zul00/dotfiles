/usr/bin/VBoxClient-all

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec i3

