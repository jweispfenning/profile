#!/bin/bash

while [[ $# -gt 0 ]]; do
	case "$1" in
		-e|--export)
			EXPORT=true
			shift
			;;
		-i|--import)
			IMPORT=true
			shift
			;;
		*)
			echo "invalid option $1"
			exit 3
	esac
done
 
if [ ! -z $EXPORT ]; then
	cp .bashrc ~/.bashrc;
	cp .bash_profile ~/.bash_profile;
	cp .vimrc ~/.vimrc
	cp .config/nvim/init.vim ~/.config/nvim/init.vim;
	cp .gitconfig ~/.gitconfig;
elif [ ! -z $IMPORT ]; then
	cp ~/.bashrc .bashrc;
	cp ~/.bash_profile .bash_profile;
	cp ~/.vimrc .vimrc
	cp ~/.config/nvim/init.vim .config/nvim/init.vim;
	cp ~/.gitconfig .gitconfig;
else 
	echo "need an option";
fi
