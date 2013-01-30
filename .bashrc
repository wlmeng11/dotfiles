#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

#set vim as manpage viewer
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
	vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
	-c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
	-c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

PATH=$PATH:/opt/android-sdk/platform-tools/
PATH=$PATH:/opt/android-sdk/tools/
PATH=$PATH:~/android/bin
PATH=$PATH:/home/wlmeng/bin/
PATH=$PATH:/home/wlmeng/.gem/ruby/1.9.3/bin
#PATH=$PATH:/home/wlmeng/.gem/ruby/1.9.1/bin
ANDROID_JAVA_HOME=/opt/java6
export ANDROID_JAVA_HOME
export PATH
export EDITOR="vim"

shopt -s autocd

shopt -s histappend
PROMPT_COMMAND='history -a'
export HISTTIMEFORMAT="%h/%d -- %H:%M:%S "

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=2000

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias vi='vim'

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

#set -o vi

alias pacman-clean='sudo pacman -Rns $(pacman -Qqtd)'
