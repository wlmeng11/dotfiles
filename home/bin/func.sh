#!/bin/sh
# Custom shell functions

# set the PS1 prompt with colors, exit code, and git-branch info
set_prompt() {
	local GREEN="\[\e[1;32m\]"
	local BLUE="\[\e[1;34m\]"
	local YELLOW="\[\e[1;33m\]"
	local RED="\[\e[1;31m\]"
	local ENDCOLOR="\[\e[m\]"
	if [ $TERM = "dumb" ]; then
		PS1="\u@\h \W [\$?] $(echo '$(__git_ps1 " (%s)")') $ " # no colors
	else
		PS1="$GREEN\u@\h $BLUE\W $RED[\$?] $YELLOW$(echo '$(__git_ps1 " (%s)")') $BLUE\$ $ENDCOLOR"
	fi
}

# Custom functions to check for ssh and tty
is_ssh() {
	[[ -n $SSH_CONNECTION ]] || [[ -n $SSH_CLIENT ]] || [[ -n $SSH_TTY ]]
}
is_tty() {
	[[ $(tty) == /dev/tty* ]]
}
is_gui() {
	[[ -n "$DISPLAY" ]]
}
is_root() {
	[[ $EUID -eq 0 ]]
}

duf() {
	du -sk "$@" | sort -n | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}\t${fname}"; break; fi; size=$((size/1024)); done; done
}

### From: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
fancy-ctrl-z () {
if [[ $#BUFFER -eq 0 ]]; then
	BUFFER="fg"
	zle accept-line
else
	zle push-input
	zle clear-screen
fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
