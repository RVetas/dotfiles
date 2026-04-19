#!/bin/bash

rm ~/.netrc ~/.gitconfig ~/.gitconfig-company ~/.gitconfig-personal ~/.zshrc ~/.p10k.zsh ~/.ssh ~/.vimrc ~/.aider.conf.yml ~/.tmux.conf
rm -rf ~/.codex
rm -rf ~/.vim
rm -rf ~/.config/opencode

ln -s $(pwd)/.netrc ~/.netrc
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.gitconfig-company ~/.gitconfig-company
ln -s $(pwd)/.gitconfig-personal ~/.gitconfig-personal
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.p10k.zsh ~/.p10k.zsh
ln -s $(pwd)/.ssh ~/.ssh
ln -s $(pwd)/.vim ~/.vim
ln -s $(pwd)/.vimrc ~/.vimrc
# TODO: - Delete
# ln -s $(pwd)/.aider.conf.yml ~/.aider.conf.yml
ln -s $(pwd)/.config/opencode ~/.config/opencode
# TODO: - Delete
# ln -s $(pwd)/.config/opencode/opencode.json ~/.config/opencode/opencode.json
# ln -s $(pwd)/.config/opencode/agents ~/.config/opencode/agents
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/daemons/com.davmail.app.plist /Library/LaunchDaemons/com.davmail.app.plist

