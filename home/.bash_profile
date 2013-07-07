#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then # only run from tty7
	#startx -- :0 vt7 # Start default X session on display 0, tty7
fi
