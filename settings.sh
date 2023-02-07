#!/bin/zsh

while [[ $# -gt 0 ]]; do
	case "$1" in
		-g|--get)
			IMPORT=true
			shift
			;;
		*)
			echo "invalid option $1"
			exit 3
	esac
done

# if [ ! -z $EXPORT ]; then
	# cp .zshrc ~/.zshrc;
	# cp .bash_profile ~/.bash_profile;
	# cp .vimrc ~/.vimrc
	# cp -r .config/ ~/;
	# cp .gitconfig ~/.gitconfig;
	# mkdir ~/.vim
	# ln -s ~/.config/nvim/swapfiles ~/.vim/swapfiles
	# ln -s ~/.config/nvim/backups ~/.vim/backups
	# ln -s ~/.config/nvim/colors ~/.vim/colors
if [ ! -z $IMPORT ]; then
	cp ~/.zshrc .zshrc
	cp ~/.vimrc .vimrc
	cp ~/.config/nvim/init.vim .config/nvim/init.vim;
	cp ~/.config/nvim/after/syntax/* .config/nvim/after/syntax;
	cp ~/.gitconfig .gitconfig;
else
	echo "need an option";
fi
