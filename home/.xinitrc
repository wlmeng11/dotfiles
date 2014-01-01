#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

if [ -f $HOME/.Xmodmap ]; then
	/usr/bin/xmodmap $HOME/.Xmodmap
fi

#exec dbus-launch --exit-with-session /usr/bin/i3 # Use i3 by default
# ...or the Window Manager of your choice
while true
	do
	/usr/bin/dwm 2> /dev/null
done
