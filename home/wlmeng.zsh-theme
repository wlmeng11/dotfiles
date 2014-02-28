# vim: syntax=zsh
source ~/bin/func.sh  && greeting

local ssh_status="%{$fg_no_bold[red]%}$(is_ssh && echo 'ssh@%m ')"
local root_status="%{$fg_bold[red]%}$(is_root && echo 'root ')"
local symbol="$(is_root && echo \# || echo λ)"
local ret_status="%(?:%{$fg_bold[green]%}${symbol} :%{$fg_bold[red]%}${symbol} %s)"
local user="%{$fg[green]%}%n@%m"
PROMPT='${ssh_status}${root_status}${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
#RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"

autoload -U colors && colors
SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "

ZSH_THEME_GIT_PROMPT_PREFIX="±(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
