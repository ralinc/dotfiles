autoload -Uz colors && colors

zmodload -i zsh/complist
zstyle ':completion:*' list-colors ''

unset LSCOLORS
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS=$LSCOLORS
