#!/bin/bash

# curl -o- https://github.com/keesj/my-lazy-vim/keesj/install.sh | bash
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
        rm -rf bin/vim
        ln -s ../opt/nvim-linux64/bin/nvim bin/nvim
        ln -s bin/nvim bin/vim
fi

rm -rf ~/.config/nvim
# optional but recommended
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

git clone https://github.com/keesj/my-lazy-vim.git ~/.config/nvim
