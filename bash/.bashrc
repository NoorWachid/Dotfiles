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

PS1="\e[1;32m\u@\h\e[m \e[1;34m\w\e[m \e[0;35m\$(git_branch)\e[m\n\$ "

# prevent vim autism go crazy
alias :q='exit'

# aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias lh='ls --color=auto -lh'
alias nd='nnn -d'
alias nc="nnn -d && . ~/.config/nnn/.lastd"
