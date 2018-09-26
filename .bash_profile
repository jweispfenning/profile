#.bash_profile
HISTSIZE=10000
HISTFILESIZE=10000

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# User specific environment and startup programs
export VISUAL=nvim

export CLICOLOR=1
export EDITOR="$VISUAL"
export LANG=C
export LSCOLORS=gxfxcxdxbxegedabagacad
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export PAGER=vimpager

# JUMPCLOUD
export GOPATH="/Users/jweispfenning/repositories/go"
export JUMPCLOUD_WORKSPACE="$HOME/repositories/go/src/github.com/TheJumpCloud"
export PGDATA="/var/lib/postgresql/data/pdgata"
#PATH="$PATH:$HOME/miniconda3/bin"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/Applications/google-cloud-sdk/bin"
PATH="$PATH:/Users/jweispfenning/.nvm/versions/node/v4.8.6/bin"
export PATH

# NVM
#NVM_BIN="/Users/jweispfenning/.nvm/versions/node/v4.8.6/bin"
#NVM_DIR="/Users/jweispfenning/.nvm"

# added by Miniconda3 installer
export PATH="/Users/jweispfenning/miniconda3/bin:$PATH"
