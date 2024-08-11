# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/marc/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias mkdir="mkdir -p"
alias h="history"
alias ..="cd .."
alias ...="cd ../.."
alias tmux="tmux -2"

alias ld="eza -lD"
alias lf="eza -lf --color=always | grep -v /"
alias lh="eza -dl .* --group-directories-first"
alias ll="eza -alh --group-directories-first --git"
alias lt="eza -al --sort=modified"

dive() {
    docker run --rm -it \
           -v /var/run/docker.sock:/var/run/docker.sock \
           wagoodman/dive:latest \
           "$1"
}


# starhip
eval "$(starship init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
