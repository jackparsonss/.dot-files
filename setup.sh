#!/bin/bash
ln -s .vimrc ~/.vimrc
ln -s .zshrc ~/.zshrc
ln -s .config ~/.config
ln -s .bashrc ~/.bashrc
ln -s .gitconfig ~/.gitconfig
ln -s .ideavimrc ~/.ideavimrc
ln -s .tmux.conf ~/.tmux.conf
ln -s .oh-my-zsh ~/.oh-my-zsh
ln -s .bash_profile ~/.bash_profile

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

os_name=$(uname -s)
if [ "$os_name" == "Darwin" ]; then
    brew bundle --file Brewfile
fi