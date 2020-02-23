setopt histignorealldups sharehistory

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.cache/zhistory
export KEYTIMEOUT=1
export FZF_DEFAULT_OPTS='--reverse --height 50%'

bindkey -v
bindkey "\e[3~" delete-char

autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

gitbr() { git rev-parse --abbrev-ref HEAD 2> /dev/null }

preexec() { print -Pn "\e]0;$1\a" }
precmd() { 
	newline=$'\n'
	export PROMPT="%B%F{45}%n%f%b%B%F{135}@%f%b%B%F{198}%m%f%b%B%F{blue} %~%f%b $(gitbr) ${newline}\$ "

	print -Pn "\e]0;%n@%m %~\a" 
}

alias ls='ls --color=auto'
alias pacman='sudo pacman'
alias nn='nnn -d'
alias v.='vi $(fd -Ht f . ~/dotfiles | fzf)'
alias vu='vi $(fzf)'
alias br='sudo vim /sys/class/backlight/intel_backlight/brightness'

source ~/.config/zsh/completion.zsh
source ~/.config/zsh/key-bindings.zsh
