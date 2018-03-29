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
	cp -r .config/ ~/;
	cp .gitconfig ~/.gitconfig;
elif [ ! -z $IMPORT ]; then
	cp ~/.bashrc .bashrc;
	cp ~/.bash_profile .bash_profile;
	cp ~/.vimrc .vimrc
	cp ~/.config/nvim/init.vim .config/nvim/init.vim;
	cp ~/.config/nvim/after/ .config/nvim/after;
	cp ~/.gitconfig .gitconfig;
	mkdir ~/.vim
	ln -s ~/.config/nvim/swapfiles ~/.vim/swapfiles
	ln -s ~/.config/nvim/backups ~/.vim/backups
	ln -s ~/.config/nvim/colors ~/.vim/colors
else 
	echo "need an option";
fi
