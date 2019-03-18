BASE="$HOME/.zsh"
ZSH_THEME=""

export ZSH=$HOME/.oh-my-zsh
plugins=(git bundler rails)
source $ZSH/oh-my-zsh.sh

for file in $BASE/*.zsh; do
  source "$file"
done

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

source ~/.bin/tmuxinator.zsh
source ~/.zshrc.local
