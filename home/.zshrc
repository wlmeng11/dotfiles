# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/wlmeng.zsh-theme
source ~/.bash_func
greeting

# User configuration
if [ -n "$DISPLAY" ]; then
	# Check for detached tmux sessions and attach to it, else create new
	[[ -z "$TMUX" ]] && ((tmux ls | grep -vq attached && tmux at) || tmux)
    export EDITOR=vim
else
    export EDITOR=vim
fi

# set PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/opt/android-sdk/platform-tools/
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/workspace/robotics/ucpp/ucpp
PATH=$PATH:$HOME/bin/tmuxstart
export PATH
#export PATH="/home/wlmeng/.rvm/gems/ruby-2.1.0/bin:/home/wlmeng/.rvm/gems/ruby-2.1.0@global/bin:/home/wlmeng/.rvm/rubies/ruby-2.1.0/bin:/home/wlmeng/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/wlmeng/.rvm/bin:/home/wlmeng/.rvm/bin:/opt/android-sdk/platform-tools/:/home/wlmeng/bin:/home/wlmeng/workspace/robotics/ucpp/ucpp:/home/wlmeng/bin/tmuxstart"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

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

alias killwithfire="killall -9"
alias freeze='killall -STOP'
alias unfreeze='killall -CONT'
alias reload='source ~/.zshrc'
