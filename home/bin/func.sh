#!/bin/bash
# Custom bash functions

function fullname() {
	cat /etc/passwd | grep $USER | cut -d: -f5 | sed 's/,//g'
}

function firstname() {
	fullname | awk '{print $1}'
}

function get_shell() {
	ps --pid $$ | tail -1 | awk '{print $4}' | sed 's/.*/\U&/'
}

# Space Odyssey style greeting
function greeting() {
	# Greeting
	local HOUR=$(date +"%H")
	local GREETING=morning
	if [ $HOUR -ge 12 ]; then
		GREETING=afternoon
	fi
	if [ $HOUR -ge 18 ]; then
		GREETING=evening
	fi
	echo "Good $GREETING, $(firstname). This is $(get_shell). I'm ready for my first command."
}

# Handle errors, HAL 9000 style
function err_handle {
	status=$?
	lastcmd=$(history | tail -1 | sed 's/^ *[0-9]* *//')

	echo "I'm sorry, $(firstname). I'm afraid I can't do that."
}

# set the PS1 prompt with colors, exit code, and git-branch info
function set_prompt() {
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
non_gui() {
	is_ssh || is_tty
}