#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ ' #Standard PS1

# RVM
[[ -r "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion" # RVM bash completion

#set vim as manpage viewer
#export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
#	vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
#	-c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
#	-c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

export EDITOR="vim"
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

# Pacman aliases
alias pacman-clean='sudo pacman -Rns $(pacman -Qqtd)'
