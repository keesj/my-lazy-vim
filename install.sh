#!/bin/bash

# curl -o- https://raw.githubusercontent.com/keesj/my-lazy-vim/keesj/install.sh | bash

# TODO: Add Check git / curl persent
TOOLS="git tar wget"
for i in $TOOLS; do
	if ! type $i 1>/dev/null 2>/dev/null; then
		echo MISSING TOOL $i
		exit 1
	fi
done
# TODO: Check for exising install (preffer git pull v.s. clone)
# TODO: Diff before updating
# TODO: Fail early in the script if it fails
# TODO: Bail out of first error
# TODO: Add extra script next to nvim to update itself
# TODO: Allow to switch from http checkout to checkout over ssh e.g. git remote add rw  git@github.com:keesj/my-lazy-vim.git
# TODO: Add wget syntax
mkdir -p opt
rm -rf ~/opt/nvim-linux
wget -qO- https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz | tar zxvf - -C ~/opt
if ! grep -q '${HOME}/bin' ~/.bashrc; then
	echo 'export PATH="${HOME}/bin:${PATH}"' >>~/.bashrc
	echo 'alias vim="nvim"' >>~/.bashrc
fi
if [ ! -d bin ]; then
	mkdir bin
fi
if [ ! -e bin/nvim ]; then
	rm -rf bin/nvim
	ln -s ../opt/nvim-linux64/bin/nvim bin/nvim
fi

if [ -d ~/.config/nvim/.git ]; then
	echo "GIT directory found"
	(
		cd ~/.config/nvim/
		git pull
	)
else
	echo "GIT directory NOT found"
	rm -rf ~/.config/nvim/.git
	git clone https://github.com/keesj/my-lazy-vim.git ~/.config/nvim
fi
# optional but recommended
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

echo "## COPY / PASE in root shell"
echo
echo sudo apt-get install tmux ripgrep moreutils build-essential silversearcher-ag python3-venv curl wget git okular feh
echo python3 -mvenv .venv
echo 'export PATH="${HOME}/.venv/bin:${PATH}"'
