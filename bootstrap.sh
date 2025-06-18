#!/bin/bash
# Константы, для печати цветного текста
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
NC='\033[0m' # Сброс цвета

if ! [[ -e "./key" ]]; then
	echo -e "${RED}Ключ git-crypt по пути ./key не найден${NC}"
	exit 1
fi

echo -e "Установка Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo -e "Установка oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "Установка p10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

brewList=$(xargs < brew-list)
echo -e "Установка ${YELLOW}${brewList}"
xargs brew install < brew-list

git crypt unlock key
echo -e "Разблокировка репозитория"

echo -e "Установка симлинков"
./symlinks.sh

echo -e "Установка плагинов zsh"
./zsh-plugins.sh

echo -e "Установка ruby 3.4.3"
rbenv install 3.4.3

echo -e "Установка solargraph (lsp server для Ruby)"
~/.rbenv/versions/3.4.3/bin/gem install solargraph

git submodule update --init
