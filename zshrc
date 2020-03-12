BASE="$HOME/.zsh"
ZSH_THEME=""

export ZSH=$HOME/.oh-my-zsh
plugins=(git bundler rails)
source $ZSH/oh-my-zsh.sh

for file in $BASE/*.zsh; do
  source "$file"
done

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(rbenv init -)"
eval "$(pyenv init -)"

source ~/.zshrc.local
