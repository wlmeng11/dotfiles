#!/bin/sh

alias "fixdns"="echo 'nameserver 8.8.8.8' | sudo tee /etc/resolve.conf"
alias "rpi-serial"="screen /dev/ttyUSB0 115200"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# other aliases
alias l="ls --ignore='*.o' --ignore='*.class'"
alias ll='ls -alF'
alias la='ls -A'
alias lt="ls --time-style='+%d-%m-%Y %H:%M:%S' -l "
alias lstree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

alias sftp="sftp -r" # Use sftp in recursive mode
alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"

alias vim='env TERM=screen-256color vim -c "source ~/.vimrc"'
alias vi='vim'
alias gvim='gvim -c "source ~/.vimrc"'
alias emacs='env TERM=xterm-256color emacs'
alias ed='ed -p:'
alias red='red -p:'

alias killwithfire="killall -9"
alias freeze='killall -STOP'
alias unfreeze='killall -CONT'
alias reload='source ~/.zshrc'
alias ts='tmuxstart'

alias uu="sudo apt-get update && sudo apt-get upgrade"
