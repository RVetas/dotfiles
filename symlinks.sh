#!/bin/bash

rm ~/.netrc ~/.gitconfig ~/.gitconfig-company ~/.gitconfig-personal ~/.zshrc ~/.p10k.zsh ~/.ssh ~/.vimrc .aider.conf.yml
rm -rf ~/.vim

ln -s $(pwd)/.netrc ~/.netrc
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.gitconfig-company ~/.gitconfig-company
ln -s $(pwd)/.gitconfig-personal ~/.gitconfig-personal
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.p10k.zsh ~/.p10k.zsh
ln -s $(pwd)/.ssh ~/.ssh
ln -s $(pwd)/.vim ~/.vim
ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.aider.conf.yml ~/.aider.conf.yml

