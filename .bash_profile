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
