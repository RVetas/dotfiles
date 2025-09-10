"""""" Плагины
filetype plugin indent on
"""""" Общее
set updatetime=500                  " Частота обновления vim
set tags=tags;/ 					" Ищет теги во всех директориях до рута
set tags+=tags,./tags               " Где искать теги
set noexpandtab                     " Не превращать табы в пробелы
set autoindent                      " Автоматический отступ
set autowrite                       " Автоматически сохраняет файл при использовании :make
set splitright                      " открывать сплиты справа
set foldmethod=marker 				" Складывать текст по маркеру
set nofoldenable                    " По-умолчанию не складыдывать текст в фолды
set viewoptions-=curdir             " Убирает сохранение директории при сохранении view
set viewoptions-=options 			" Убирает сохранение локальных настроек при сохранении view
set showcmd                         " Показывает текущую команду в статусбаре
set ignorecase                      " Игнорирует кейс при поиске
set smartcase                       " Если в поиске есть заглавные буквы, затирает ignorecase
set linebreak 						" Переносить строку по словам
set relativenumber 					" Относительная нумерация строк
autocmd InsertLeave,FocusLost * if &modifiable && &modified | silent! write | endif
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview
"""""" Параметры отображения
set hlsearch                        " Подсвечивать результаты поиска
set number                          " Показывать номера строк
set ruler                           " Указатель на строку и символ в правом нижнем углу
set tabstop=4                       " Количество пробелов в табе
set shiftwidth=4                    " Количество пробелов в одном уровне отступа
set cursorline                      " Подсвечивать строку, на которой находится курсор
syntax on                           " Подсветка синтаксиса
set scrolloff=15					" Сколько строк оставлять вокруг курсора при скролле 
set smoothscroll
set scroll=5                        " Сколько строк прокручивать при скролле Ctrl-d, Ctrl-u
set signcolumn=yes                  " Показывать колонку знаков (используется плагинами)
"""""""""""" Настройки курсора
let &t_EI .= "\e[1 q"               " Normal (линейный курсор)
let &t_SI .= "\e[1 q"               " Insert (блочный курсор)
let &t_SR .= "\e[1 q"               " Visual (стандартный курсор)


"""""" Борьба с раскладкой
"" Автоматически переключать на английскую раскладку в NORMAL-режиме
"" Позволяет нормально пользоваться vim без необходимости постоянно переключать раскладки
set langmap=фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ
set iminsert=1
set imsearch=0

"""""" Настройки UltiSnips
let g:UltiSnipsExpandTrigger = '<C-e>'                        " Ctrl-e : раскрыть сниппет
"let g:UltiSnipsJumpForwardTrigger = '<C-j>'                   " Ctrl-j : пройти вперед по сниппету
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"] " В каких папках искать сниппеты

"""""" Настройки CtrlP
let g:ctrlp_root_markers = ["go.mod", ".ctrlp_root"] " Добавляет go.mod в качестве маркера корневой директории
let g:ctrlp_show_hidden = 1

"""""" Подключаем fzf
set rtp+=/opt/homebrew/opt/fzf
nmap <C-s> :FZF<CR>

"""""" NERDTree
nnoremap <C-t> :call OpenTree()<CR>
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1

function! OpenTree() abort
	if exists("g:NERDTree") && g:NERDTree.IsOpen() 
		execute 'NERDTreeClose'
		return
	endif
	execute 'NERDTreeFind'
endfunction

"""""" Подключаю свои файлы
source ~/.vim/coc.vim
source ~/.vim/functions.vim
source ~/.vim/generalCode.vim
source ~/.vim/go.vim
source ~/.vim/groovy.vim
source ~/.vim/html.vim
source ~/.vim/mappings.vim
source ~/.vim/markdown.vim
source ~/.vim/swift.vim
source ~/.vim/tmux.vim

