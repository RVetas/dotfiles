if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Если устанавливать через oh-my-zsh
autoload -Uz compinit && compinit

plugins=(
	git
	zsh-completions
	zsh-syntax-highlighting
	zsh-autosuggestions
	)

source $ZSH/oh-my-zsh.sh
eval "$(/opt/homebrew/bin/brew shellenv)"

# Настройки плагинов
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=247"

# Руби
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(rbenv init -)"

# Добавляем ключики
ssh-add -A 2>/dev/null

# Прописываю реальное расположение дотфайлов в переменные окружения
zshrcPath="$(realpath ~/.zshrc)"
dotfilesPath=${zshrcPath%/*}
export REAL_ZSHRC_PATH=${zshrcPath}
export DOTFILES_PATH=${dotfilesPath}

source ${DOTFILES_PATH}/.secrets
source ${DOTFILES_PATH}/.aliases
source ${DOTFILES_PATH}/.functions

# Пути для инструментов
export GOPATH="$HOME/go"
export GOPRIVATE=git.moscow.alfaintra.net
export PATH="$PATH:$GOPATH/bin"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
export PATH="$PATH:/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export PATH="$JAVA_HOME/bin:$PATH"
export SOURCEKIT_LOGGING=3
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"
export JAVA_HOME='/opt/homebrew/opt/openjdk@17'
# export JAVA_HOME="/opt/homebrew/Cellar/openjdk/23.0.2/libexec/openjdk.jdk/Contents/Home"


export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

