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
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

export VISUAL=vim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
export PAGER=vimpager
export LANG=C;
export NVIM_TUI_ENABLE_TRUE_COLOR=1
