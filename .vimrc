" Плагины
filetype plugin indent on
packadd YouCompleteMe
" Параметры отображения
set number                          " Показывать номера строк
set ruler                           " Указатель на строку и символ в правом нижнем углу
set tabstop=4                       " Количество пробелов в табе
set shiftwidth=4                    " Количество пробелов в одном уровне отступа
set cursorline                      " Подсвечивать строку, на которой находится курсор
set colorcolumn=120                 " Вертикальная полоса, отмеряющая 120 символов
syntax on                           " Подсветка синтаксиса
colorscheme Tomorrow-Night          " Цветовая схема
highlight! link CursorLineNr LineNr " Выключает подсветку номера текущей строки
set scrolloff=15					" Сколько строк оставлять вокруг курсора при скролле 
set scroll=5
"" Настройки курсора
let &t_EI .= "\e[2 q"               " Вставка (линейный курсор)
let &t_SI .= "\e[2 q"               " Normal (блочный курсор)
let &t_SR .= "\e[2 q"               " Visual (стандартный курсор)

set noexpandtab                     " Превращать таб в пробелы
set autoindent                      " Автоматический отступ
set autowrite                       " Автоматически сохраняет файл при использовании :make

set splitright                      " открывать сплиты справа

" Борьба с раскладкой, начало
"" Автоматически переключать на английскую раскладку в NORMAL-режиме
"" Позволяет нормально пользоваться vim без необходимости постоянно переключать раскладки
set langmap=фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ
let s:TO_ENG = 'xkbswitch -s com.apple.keylayout.ABC'
set iminsert=1
set imsearch=0

" autocmd CmdlineLeave * call system(s:TO_ENG) " При выходе из командного режима
" autocmd CmdlineEnter * call system(s:TO_ENG) " При входе в командный режим
" autocmd ModeChanged *:n call system(s:TO_ENG) " При входе в NORMAL – английский
" autocmd InsertLeave * call system(s:TO_ENG)  " При выходе из INSERT – английский
" Борьба с раскладкой, конец

" Настройки vim-go
" let g:go_test_timeout = '10s' " таймаут тестов
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_doc_popup_window = 1 " показывать GoDoc / Shift-K в попапе
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
"" Функции
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
"" Шорткаты
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>f <Plug>(go-fmt)

""" Переносы строк, странные символы из-за MacOS, они означают Alt-J и Alt-K
"inoremap <C-j> <nop> " отключает скролл в режиме insert
"inoremap <C-h> <nop> " отключает скролл в режиме insert
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
" inoremap ∆ <Esc>:m .+1<CR>==gi
" inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Настройки YouCompleteMe
" Шорткаты
let g:ycm_use_ultisnips_completer = 1 " использовать UltiSnips сниппеты
let g:ycm_enable_inlay_hints = 1 " хинты внутри, экспериментальная фича
let g:ycm_min_num_of_chars_for_completion = 1 " подсказки начинаются с одного набранного символа
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '!!'
let g:ycm_echo_current_diagnostic = 'virtual-text'
let g:ycm_clear_inlay_hints_in_insert_mode = 1 " убирает хинты при переходе в режим редактирования
nnoremap <silent> <leader>h <Plug>(YCMToggleInlayHints)
" set completeopt-=preview " отключает сплит при показе подсказок
let g:ycm_add_preview_to_completeopt="popup"
" let g:ycm_semantic_triggers =  { " настройки включения семантических подсказок, не очень понравилось, т.к. сниппеты пропадают быстро 
" 		\   'go': [ 're!\w{3}' ],
"  \ }
source /Users/rvetas/dev/personal/other/lsp-examples/vimrc.generated " добавляет поддержку groovy, ruby, docker

" Настройки UltiSnips
let g:UltiSnipsExpandTrigger = '<C-e>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
" Настройки CtrlP
let g:ctrlp_root_markers = ["go.mod"] " Добавляет go.mod в качестве маркера корневой директории


" Подключаем fzf
set rtp+=/opt/homebrew/opt/fzf
nmap <C-s> :FZF<CR>
