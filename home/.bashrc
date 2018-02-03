#
# William Meng's ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.git-prompt.sh ]] && . ~/.git-prompt.sh
[[ -f ~/bin/func.sh ]] && . ~/bin/func.sh # custom bash functions

# RVM
[[ -r "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion" # RVM bash completion

# Call custom functions
greeting
set_prompt
trap 'err_handle' ERR

if [ -n "$DISPLAY" ]; then
	# Check for detached tmux sessions and attach to it, else create new
	#[[ -z "$TMUX" ]] && ((tmux ls | grep -vq attached && tmux at) || tmux)
    export EDITOR=vim
else
    export EDITOR=vim
fi

# Export some variables
export TZ="/usr/share/zoneinfo/US/Pacific"
export BC_ENV_ARGS=~/.bcrc
export ANDROID_JAVA_HOME=/opt/java6
export CLASSPATH=./
export CLASSPATH=$CLASSPATH:/usr/share/java/*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/opt/android-sdk/platform-tools/
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/workspace/robotics/ucpp/ucpp
PATH=$PATH:$HOME/bin/tmuxstart
export PATH

#ulimit -u 1000 # Limit nproc to prevent fork bombs
shopt -s extglob # extended pattern language
shopt -s autocd
shopt -s histappend # append to history file
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
alias l='ls -dC !(*.class|*.o)'
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

alias killwithfire="killall -9"
alias freeze='killall -STOP'
alias unfreeze='killall -CONT'
alias reload='source ~/.bashrc'

# Pacman aliases
alias pacman-clean='sudo pacman -Rns $(pacman -Qqtd)'
