#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Check for detached tmux sessions and attach to it, else create new
[[ -z "$TMUX" ]] && ((tmux ls | grep -vq attached && tmux at) || tmux)

#PS1='[\u@\h \W]\$ ' #Standard PS1

if [ -n "$DISPLAY" ]; then
    EDITOR=gvim
	setxkbmap -option caps:escape
else
    EDITOR=vim
fi

# RVM
[[ -r "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion" # RVM bash completion


# Export some variables
export BC_ENV_ARGS=~/.bcrc
export ANDROID_JAVA_HOME=/opt/java6

PATH=$PATH:/opt/android-sdk/platform-tools/
PATH=$PATH:/home/wlmeng/workspace/robotics/ucpp/ucpp
export PATH

ulimit -u 1000 # Limit nproc to prevent fork bombs
shopt -s autocd
shopt -s histappend
PROMPT_COMMAND='history -a'
export HISTTIMEFORMAT="%h/%d -- %H:%M:%S "

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000000000
HISTFILESIZE=20000000

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
#alias l='ls -CF'
alias l='ls'
alias lt="ls --time-style='+%d-%m-%Y %H:%M:%S' -l "

alias sftp="sftp -r" # Use sftp in recursive mode
alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"

# Pacman aliases
alias pacman-clean='sudo pacman -Rns $(pacman -Qqtd)'
