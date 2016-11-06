export LANG=en_US.UTF-8
export EDITOR=vim

DISABLE_LS_COLORS="true"
ZSH_THEME="clean"

export ZSH=$HOME/.oh-my-zsh
plugins=(git bundler)

source $ZSH/oh-my-zsh.sh

alias ll="ls -la"
alias tl="tail -f log/development.log"
alias ctags="`brew --prefix`/bin/ctags"
alias gph="git push heroku master && heroku run rake db:migrate && heroku restart"

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(rbenv init -)"
