# Path to your oh-my-zsh installation.
export ZSH="/Users/jweispfenning/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

########################
# FUNCTIONS
########################
function c {
  if [ -d $1 ] || [ -z $1 ]; then
    cd $1
    ls -l;
  else
    nvim $1;
  fi
}

function repo {
  for r in $REPO_LOCATIONS; do
    cd $r;
    if [ -d $1 ]; then
      cd $1;
      return;
    fi
  done
}

function book {
  local orig_location=${PWD}
  repo scrapper;
  v_activate;
  ./run $@;
  deactivate;
  cd $orig_location;
}

function reset_dns {
  networksetup -setdnsservers Wi-Fi 192.168.50.1 192.168.50.100
  sudo dscacheutil -flushcache
  sudo killall -HUP mDNSResponder
}

function v_activate {
  local orig_location=${PWD}

  [ ! -n ${VIRTUAL_ENV} ] && deactivate
  [ ! -z "$1" ] && repo $1

  source .venv/bin/activate
  cd $orig_location
}


########################
# LOAD ZSH STUFF
########################
export REPO_LOCATIONS=(
  ~/Documents
)
source $ZSH/oh-my-zsh.sh

compdef _repo repo v_activate
compdef _book book

########################
# SHELL SETUP
########################
export HISTSIZE=10000000
export SAVEHIST=10000000
setopt EXTENDED_HISTORY

# set vi mode
set -o vi

# mac os ls coloros
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# misc
function consolidate_path {
  typeset -U path_array  # -U ensures unique elements
  path_array=(${(s/:/)PATH})
  export PATH="${(j/:/)path_array}"
}

export PATH="/Users/jweispfenning/.local/bin:$PATH"
consolidate_path;

# needs to be first in PATH
export PATH="/usr/local/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

# enable reverse search
bindkey -v
bindkey '^R' history-incremental-search-backward


########################
# ALIASES & FUNCTIONS
########################
# clears alias namespace
unalias -a

# needs to go first
alias vim='nvim'

# generic ones
alias deject='diskutil eject'
alias dns_server='ssh jweispfenning@192.168.50.100'
alias env='env | sort'
alias grep='grep -I'
alias itsfine='xattr -d com.apple.quarantine'
alias ll='ls -lA'
alias ls='ls -G'
alias newa='vim ~/.zshrc'
alias newg='vim ~/.gitconfig'
alias newv='vim ~/.vimrc'
alias reload='source ~/.zshrc'
alias rtop='function _a_func {
  cd "$(git rev-parse --show-toplevel 2>/dev/null)";
}; _a_func'
alias scut='cut -c1-250'


########################
# PROMPT
########################
autoload -U vcs_info colors && colors
zstyle ':vcs_info:git*' enable git
zstyle ':vcs_info:git*' formats "%B%F{blue}%s:[%f%F{red}%b%f%F{blue}]%f"
setopt prompt_subst


function git_prompt {
  local prefix="%F{cyan}➜%f  "
  local suffix="%B\$%b "
  local path_part="%F{green}${PWD/#$HOME/~}%f "
  local git_part=""
  local python_part=""

  # get python info
  if [[ -n $VIRTUAL_ENV ]]; then
    local active_python=$(which python)
    python_part=${${active_python%%/.venv/*}:t}
  else # its the root
    python_part="root"
  fi
  python_part="(%F{yellow}$python_part%f) "

  # get git info
  if [[ -n ${vcs_info_msg_0_} ]]; then
    local repo_path=$(git rev-parse --show-toplevel)
    local prompt_path=${repo_path:t}/${PWD#$repo_path/}
    if [[ ${repo_path} == ${PWD} ]]; then
      prompt_path=${repo_path:t}
    fi

    # we are in a git repo so override path
    path_part="%F{green}${prompt_path}%f "
    git_part="%B${vcs_info_msg_0_}%b "
  fi

  PROMPT="${prefix}${path_part}${git_part}${python_part}${suffix}"
}


# Add vcs_info only if not already in precmd_functions
if [[ -z "${precmd_functions[(r)vcs_info]}" ]]; then
  precmd_functions+=(vcs_info)
fi

if [[ -z "${precmd_functions[(r)git_prompt_old]}" ]]; then
  precmd_functions+=(git_prompt)
fi

