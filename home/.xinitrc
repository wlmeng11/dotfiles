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

if [[ $1 == "gnome" ]]
then
	exec gnome-session
elif [[ $1 == "kde" ]]
then
	exec startkde
elif [[ $1 == "xfce" ]]
then
	exec startxfce4
elif [[ $1 == "enlightenment" ]]
then
	exec enlightenment_start
elif [[ $1 == "dwm" ]]
then
	exec dwm
elif [[ $1 == "i3" ]]
then
	exec i3
else
	echo "Choose a window manager"
fi
# ...or the Window Manager of your choice
