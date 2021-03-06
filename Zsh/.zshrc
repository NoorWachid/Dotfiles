setopt histignorealldups sharehistory

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.cache/zhistory
export KEYTIMEOUT=1
export FZF_DEFAULT_OPTS='--reverse --height 50%'
export ZLE_RPROMPT_INDENT=0

bindkey -v
bindkey "\e[3~" delete-char

autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

gitbr() { git rev-parse --abbrev-ref HEAD 2> /dev/null }

preexec () {
    print -Pn "\e]0;$1\a"
}
precmd() { 
    print -Pn "\e]0;%~\a"
    export PROMPT="%F{205}\$%f "
    export RPROMPT="%F{253}$(gitbr)%f %F{249}%~%f"
}

source ~/.config/zsh/alias.zsh
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/fzf/completion.zsh
source ~/.config/zsh/fzf/key-bindings.zsh
