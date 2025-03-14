#!/bin/bash

rm ~/.netrc ~/.gitconfig ~/.gitconfig-company ~/.gitconfig-personal ~/.zshrc ~/.p10k.zsh ~/.ssh

ln -s $(pwd)/.netrc ~/.netrc
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.gitconfig-company ~/.gitconfig-company
ln -s $(pwd)/.gitconfig-personal ~/.gitconfig-personal
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.p10k.zsh ~/.p10k.zsh
ln -s $(pwd)/.ssh ~/.ssh