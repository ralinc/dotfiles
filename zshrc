BASE="$HOME/.zsh"
ZSH_THEME=""

export ZSH=$HOME/.oh-my-zsh
plugins=(git bundler rails tmux)
source $ZSH/oh-my-zsh.sh

for file in $BASE/*.zsh; do
    source "$file"
done

export FZF_DEFAULT_OPTS='--height=33% --layout=reverse'
export FZF_DEFAULT_COMMAND='ag -g ""'

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:$PATH

export VOLTA_HOME=$HOME/.volta
export PATH=$VOLTA_HOME/bin:$PATH

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

export PYTHONDONTWRITEBYTECODE=1

eval "$(fzf --zsh)"
eval "$(pyenv init -)"
eval "$(rbenv init -)"

source ~/.zshrc.local
