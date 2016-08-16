export LANG=en_US.UTF-8
export EDITOR='vim'

DISABLE_LS_COLORS="true"
ZSH_THEME="clean"

export ZSH=$HOME/.oh-my-zsh
plugins=(bundler)
source $ZSH/oh-my-zsh.sh

alias la="ls -la"
alias tl="tail -f log/development.log"
alias ctags="`brew --prefix`/bin/ctags"

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

eval "$(rbenv init -)"
