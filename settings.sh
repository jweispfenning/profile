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
	# cp .vimrc ~/.vimrc
	# cp -r .config/ ~/;
	# cp .gitconfig ~/.gitconfig;
	# mkdir ~/.vim
	# ln -s ~/.config/nvim/swapfiles ~/.vim/swapfiles
	# ln -s ~/.config/nvim/backups ~/.vim/backups
	# ln -s ~/.config/nvim/colors ~/.vim/colors
	# mkdir -p ~/.oh-my-zsh/completions
	# cp -r completions/* ~/.oh-my-zsh/completions/
if [ ! -z $IMPORT ]; then
	cp -r ~/.config/nvim/* .config/nvim/
	cp ~/.gitconfig .gitconfig
	cp ~/.vimrc .vimrc
	cp ~/.zshrc .zshrc
	cp ~/Library/Saved\ Application\ State/com.googlecode.iterm2.savedState/windows.plist windows.plist
else
	echo "need an option";
fi
