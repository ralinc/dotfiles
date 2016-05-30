export LANG=en_US.UTF-8
export EDITOR='vim'

DISABLE_LS_COLORS="true"
ZSH_THEME="clean"

export ZSH=$HOME/.oh-my-zsh
plugins=(git bundler)
source $ZSH/oh-my-zsh.sh

export RVM_DIR="$HOME/.rvm"
export NVM_DIR="$HOME/.nvm"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export PATH="$PATH:$RVM_DIR/bin"

alias la="ls -la"

. "$(brew --prefix nvm)/nvm.sh"
[[ -s "$RVM_DIR/scripts/rvm" ]] && source "$RVM_DIR/scripts/rvm"
