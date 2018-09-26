#!/bin/bash -x
case "$-" in
*i*) interactive=1 ;;
*)   interactive=0 ;;
esac

#source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ $interactive ]; then
	unset PROMPT_COMMAND
	echo -en "\033]0;magic box\007"
	export PS1="\u:\W\$ "
fi

########################
# FUNCTIONS
########################
function kill_it {
	ps aux | grep -i "$1" | grep -v "grep" | awk '{print $2}' | xargs kill -9
}

#User specific aliases
#clears all alias
unalias -a

#needs to go first
alias vim='nvim'

#generic ones
alias deject='diskutil eject'
alias env='env | sort'
alias grep='grep -I'
alias itsfine='xattr -d com.apple.quarantine'
alias ll='ls -lA'
alias ls='ls -G'
alias newa='vim ~/.bashrc'
alias newg='vim ~/.gitconfig'
alias newv='vim ~/.vimrc'
alias reload='source ~/.bashrc'
alias rmr='rm -r'
alias scut='cut -c1-250'
alias dc='docker-compose'

#git alias
alias git_replace='function _a_func {
	git branch -D $1;
	git checkout -b $1 && git branch -u origin/$1;
}; _a_func'

alias c='function _a_func {
	if [ -d $1 ] || [ -z $1 ]; then
		cd $1
		ls -l;
	else
		nvim $1;
	fi
}; _a_func'

#leaving this so I don't forget the insane java main signature.
#alias java_main_function='echo "void main(String[] args) {"'

#leaving this so I don't forget find -exec syntax, weirdly hard to find on google
#alias find_exec='find . -name "invalid" -exec cat {} \;'

#gcloud arg: hostname

alias build_pylibs='cd ~/repositories/jumpcloud-python-libs && ./setup.py install; cd -';
alias ecr_login='$(aws ecr get-login --no-include-email --region us-west-2)';
alias auto_node='ssh john.weispfenning@10.20.1.169';
alias salt_master='ssh john.weispfenning@10.20.1.154';
alias util_node='ssh john.weispfenning@10.20.1.203';
alias sm_node='ssh john.weispfenning@10.20.0.94';
alias restart_si="function _a_func_ {
	cd ${JUMPCLOUD_WORKSPACE}/SI;
	docker stop webui;
	docker rm webui;
	docker-compose up -d webui;
	docker logs -f webui;
}; _a_func_";

alias search_si='function _a_func_ {
	grep -rns "$1" $JUMPCLOUD_WORKSPACE/SI/routes $JUMPCLOUD_WORKSPACE/SI/lib $JUMPCLOUD_WORKSPACE/SI/model
}; _a_func_';
