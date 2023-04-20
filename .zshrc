# Path to your oh-my-zsh installation.
export ZSH="/Users/jweispfenning/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

########################
# CUSTOM FUNCTIONS
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
  ./run $@;
  cd $orig_location;
}


########################
# LOAD ZSH STUFF
########################
# export REPO_LOCATIONS=()
source $ZSH/oh-my-zsh.sh


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
  echo $PATH | sed "s/:/\n/g" | sort -u > __out.txt;
  NEW_PATH="";
  for i in $(cat __out.txt); do
    if [ -z $NEW_PATH ]; then
      NEW_PATH="$i";
    else
      NEW_PATH="$NEW_PATH:$i";
    fi
  done
  rm __out.txt;
  export PATH=$NEW_PATH;
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
# ALIASES
########################
# clears alias namespace
unalias -a

# needs to go first
alias vim='nvim'

# generic ones
alias deject='diskutil eject'
alias env='env | sort'
alias grep='grep -I'
alias itsfine='xattr -d com.apple.quarantine'
alias ls='ls -G'
alias ll='ls -lA'
alias newa='vim ~/.zshrc'
alias newg='vim ~/.gitconfig'
alias newv='vim ~/.vimrc'
alias reload='source ~/.zshrc'
alias scut='cut -c1-250'
alias git_super_pull='git stash; git pp; git stash pop'
alias git_replace='function _a_func {
  git branch -D $1;
  git checkout -b $1 && git branch -u origin/$1;
}; _a_func'
alias rtop='function _a_func {
  curr_dir=${PWD}
  while [[ ! -d .git && ${PWD} != "/" ]]; do
    cd ..
  done
  cd $curr_dir > /dev/null
  cd - > /dev/null
}; _a_func'


########################
# GIT PROMPT
########################
autoload -U vcs_info colors && colors
zstyle ':vcs_info:git*' enable git
zstyle ':vcs_info:git*' formats "%B%F{blue}%s:[%f%F{red}%b%f%F{blue}]%f"
setopt prompt_subst

function git_prompt {
  a=(${(s[/])${PWD}})
  reverse=()
  for i in $a; do
    reverse=("$i" "${reverse[@]}")
  done
  npath=${PWD}
  repo_path=""

  for i in $reverse; do
    repo_path="$i/$repo_path"

    if [ -d $npath/.git ]; then
      PROMPT="%F{cyan}➜%f  %F{green}${repo_path}%f ${vcs_info_msg_0_} %B\$%b "
      return
    fi
    npath="$npath/.."
  done
  PROMPT="%F{cyan}➜%f  %F{green}%~%f %B\$%b "
}

precmd_functions+=(vcs_info git_prompt)


########################
# DOCUMENTATION
########################
# find
#   find . -name "invalid" -exec cat {} \;
#
# uniq path
#   echo $PATH | sed 's/:/\n/g' | sort | uniq -du
#
# Associative arrays
#   alias tunnel='function _a_func {
#     project=$1
#     env=$2
#     service=$3
#
#     # services
#     declare -A _platform_staging=(
#       [mysql]="9988:10.104.150.8:3306"
#       [vault]="9989:10.2.0.128:8200"
#     )
#     declare -A _platform_prod=(
#       [mysql]="9988:10.104.150.5:3306"
#       [vault]="9989:10.2.0.53:8200"
#       [vault_sql]="9990:10.104.150.2:3306"
#     )
#     declare -A _pci_staging=(
#       [mysql]="9988:10.25.0.5:3306"
#       [vault]="9989:10.2.0.100:8200"
#     )
#     declare -A _pci_prod=(
#       [mysql]="9988:10.236.0.5:3306"
#       [vault]="9989:10.2.0.27:8200"
#       [vault_sql]="9990:10.236.0.2:3306"
#     )
#
#     # envs
#     declare -A _platform=(
#       [staging]=$_platform_staging[$service]
#       [prod]=$_platform_prod[$service]
#     )
#     declare -A _pci=(
#       [staging]=$_pci_staging[$service]
#       [prod]=$_pci_prod[$service]
#     )
#
#     # projects
#     declare -A _host_info=(
#       [pci]=$_pci[$env]
#       [platform]=$_platform[$env]
#     )
#
#     # ssh -v $project-$env-bastion -L $_host_info[$project]
#     gcloud compute ssh dev-bastion --tunnel-through-iap -- -v -N -L $_host_info[$project]
#   }; _a_func'
#
#   alias login_mysql='function _a_func_ {
#     script=$1
#     debug=$2
#
#     echo "Authing to vault..."
#     login_res=$(vault login -address=http://127.0.0.1:9989 -method=github token=$(gh_token))
#
#     echo "Generating mysql creds..."
#     creds=$(vault read -address=http://127.0.0.1:9989 apps-database/creds/full -format=json)
#
#     if [ ! -z ${debug} ]; then
#       echo "\n========== DEBUG OUTPUT =========="
#       echo "  LOGIN RESULT:\n${login_res}"
#       echo "--------------------"
#       echo "  APP-DATABASE READ OPERATION:\n${creds}"
#       echo "========== END ==========\n"
#     fi
#
#     mysql_username=$(echo $creds | jq -r ".data.username")
#     mysql_password=$(echo $creds | jq -r ".data.password")
#
#     echo "Connecting to mysql..."
#     if [ ! -z $script ]; then
#       mysql -u${mysql_username} -h127.0.0.1 -P9988 -p${mysql_password} < $script
#     else
#       mysql -u${mysql_username} -h127.0.0.1 -P9988 -p${mysql_password}
#     fi
#   }; _a_func_'
