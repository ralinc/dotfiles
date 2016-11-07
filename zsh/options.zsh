HISTFILE=~/.zsh_history
HISTSIZE=1000000000000000000
SAVEHIST=$HISTSIZE

setopt no_list_beep
setopt no_beep
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt autocd
setopt autopushd
setopt extended_history
unsetopt correctall
unsetopt nomatch
unsetopt multios

export LESS="ij.5FKMRX"
