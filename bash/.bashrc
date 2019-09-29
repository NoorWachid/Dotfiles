HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

# autocomplete
. /etc/bash_completion

git_branch() { 
  git rev-parse --abbrev-ref HEAD 2> /dev/null 
}
pwd_abbr() { 
  [ ${PWD:0:${#HOME}} = $HOME ] && echo ~${PWD:${#HOME}} || echo $PWD 
}

PS1="\e[1;32m\u@\h\e[m \e[1;34m\w\e[m \e[1;31m\$(git_branch)\e[m\n\$ "
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:$(pwd_abbr)\007"'

# aliases
## prevent vim autism goes crazy
alias :q='exit'
## default flags
alias ls='ls --color=auto'
alias grep='grep --color=auto --exclude-dir=".git"'
alias nnn='nnn -d && . ~/.config/nnn/.lastd'
