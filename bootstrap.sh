#!/bin/bash
# Константы, для печати цветного текста
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
NC='\033[0m' # Сброс цвета

echo -e "${WHITE}Установка Homebrew${NC}"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo -e "${WHITE}Установка oh-my-zsh${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "${WHITE}Установка p10k${NC}"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

brewList=$(xargs < brew-list)
echo -e "${WHITE}Установка ${YELLOW}${brewList}${NC}"
xargs brew install < brew-list

echo -e "${WHITE}Установка симлинков"
./symlinks.sh

echo -e "${WHITE}Установка ruby 3.4.3"
rbenv install 3.4.3

echo -e "${WHITE}Установка solargraph (lsp server для Ruby)"
~/.rbenv/versions/3.4.3/bin/gem install solargraph

git submodule update --init
