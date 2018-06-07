#
# William Meng's ~/.zshrc
#
# Install oh-my-zsh with:
# curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
#
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

source ~/bin/func.sh
# Check for detached tmux sessions and attach to it, else create new
#! is_root && is_gui && ! is_ssh && [[ -z "$TMUX" ]] && ((tmux ls | grep -vq attached && tmux at) || tmux)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# Or just source the theme file...

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
plugins=(git wd zsh-syntax-highlighting)

# Set options
setopt AUTO_CD           # implicate cd for non-commands
setopt AUTO_PUSHD          # Push dirs into history
setopt CD_ABLE_VARS       # read vars in cd
setopt CORRECT            # correct spelling
setopt COMPLETE_IN_WORD       # complete commands anywhere in the word
setopt NOTIFY              # Notify when jobs finish
#setopt C_BASES             # 0xFF
setopt BASH_AUTO_LIST      # Autolist options on repetition of ambiguous args
setopt CHASE_LINKS         # Follow links in cds
setopt ALWAYS_TO_END       # Move to the end on complete completion
setopt LIST_ROWS_FIRST     # Row orientation for menu
setopt MULTIOS             # Allow Multiple pipes
setopt MAGIC_EQUAL_SUBST   # Expand inside equals
setopt EXTENDED_GLOB
setopt hist_ignore_dups
setopt share_history
setopt inc_append_history
setopt extended_history
HISTSIZE=500000
SAVEHIST=5000000

# Source some files
source $ZSH/oh-my-zsh.sh
source ~/wlmeng.zsh-theme
source ~/bin/path.sh # set PATH
source ~/bin/alias.sh
source /usr/share/autojump/autojump.sh
[[ -r "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion" # RVM bash completion


# User configuration
# if [ -n "$DISPLAY" ]; then
#     export EDITOR=vim
# else
    export EDITOR=vim
# fi

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
