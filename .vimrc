"""""" Плагины
filetype plugin indent on
"""""" Общее
set updatetime=500                  " Скорость обновления vim
set tags=tags;/ 					" Ищет теги во всех директориях до рута
set tags+=tags,./tags               " Где искать теги
set noexpandtab                     " Не превращать табы в пробелы
set autoindent                      " Автоматический отступ
set autowrite                       " Автоматически сохраняет файл при использовании :make
set splitright                      " открывать сплиты справа
set foldmethod=marker
set viewoptions-=curdir             " Убирает сохранение директории при сохранении view
set viewoptions-=options       " Убирает сохранение локальных настроек при сохранении view
set showcmd                         " Показывает текущую команду в статусбаре
set ignorecase                      " Игнорирует кейс при поиске
set smartcase                       " Если в поиске есть заглавные буквы, затирает ignorecase
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
set colorcolumn=120                 " Вертикальная полоса, отмеряющая 120 символов
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

""""""" Шорткаты
map <Leader>s :nohl<CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
""" Перемещение выделенных строк или строки под курсором
""" Странные символы из-за MacOS, они означают Alt-J и Alt-K
nnoremap ∆ :m .+1<CR>== 
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

"""""" Настройки UltiSnips
let g:UltiSnipsExpandTrigger = '<C-e>'                        " Ctrl-e : раскрыть сниппет
let g:UltiSnipsJumpForwardTrigger = '<C-j>'                   " Ctrl-j : пройти вперед по сниппету
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'                  " Ctrl-k : пройти назад по сниппету
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"] " В каких папках искать сниппеты

"""""" Настройки CtrlP
let g:ctrlp_root_markers = ["go.mod", ".ctrlp_root"] " Добавляет go.mod в качестве маркера корневой директории

"""""" Подключаем fzf
set rtp+=/opt/homebrew/opt/fzf
nmap <C-s> :FZF<CR>

"""""" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1

"""""" Подключаю свои файлы
source ~/.vim/coc.vim
source ~/.vim/functions.vim
source ~/.vim/go.vim
source ~/.vim/groovy.vim
source ~/.vim/hilight.vim
source ~/.vim/html.vim
source ~/.vim/insert-headers.vim
source ~/.vim/markdown.vim
source ~/.vim/ycm.vim
