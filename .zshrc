export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="clean"

DISABLE_LS_COLORS="true"

plugins=(git brew bundler gem)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/Cellar/git
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export NVM_DIR="$HOME/.nvm"
export EDITOR='vim'
export SSH_KEY_PATH="~/.ssh/id_rsa"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
