# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Load the oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Set name of the theme to load.
ZSH_THEME="clean"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew bundler gem)

# User configuration

# export http_proxy=http://proxy:8080
# export https_proxy=http://proxy:8080
export no_proxy=sap.corp,localhost

export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/Cellar/git
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export NVM_DIR="$HOME/.nvm"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Preferred editor for local and remote sessions
export EDITOR='vim'

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"
