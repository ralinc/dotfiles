BASE="$HOME/.zsh"
ZSH_THEME=""

export ZSH=$HOME/.oh-my-zsh
plugins=(git bundler rails)
source $ZSH/oh-my-zsh.sh

for file in $BASE/*.zsh; do
    source "$file"
done

export PYTHONDONTWRITEBYTECODE=1

export FZF_DEFAULT_OPTS='--height=33% --layout=reverse'
export FZF_DEFAULT_COMMAND='ag -g ""'

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:$PATH

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

eval "$(fzf --zsh)"
eval "$(mise activate zsh)"

source ~/.zshrc.local
