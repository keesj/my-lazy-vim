#!/bin/bash

# curl -o- https://raw.githubusercontent.com/keesj/my-lazy-vim/keesj/install.sh | bash
mkdir -p opt
rm -rf ~/opt/nvim-linux
wget -qO- https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz | tar zxvf - -C ~/opt
if ! grep -q '${HOME}/bin' ~/.bashrc
then
        echo 'export PATH="${HOME}/bin:${PATH}"' >> ~/.bashrc
fi
if [ ! -d bin ]
then
        mkdir bin
fi
if [ ! -e bin/nvim ]
then
        rm -rf bin/nvim
        ln -s ../opt/nvim-linux64/bin/nvim bin/nvim
fi

rm -rf ~/.config/nvim
# optional but recommended
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

git clone https://github.com/keesj/my-lazy-vim.git ~/.config/nvim
echo "## COPY / PASE in root shell"
echo
echo sudo apt-get install tmux ripgrep moreutils build-essential silversearcher-ag python3-venv curl wget
echo python3 -mvenv .venv
echo 'export PATH="${HOME}/.vent/bin:${PATH}"'
