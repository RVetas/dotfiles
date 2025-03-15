" Параметры отображения
set number
set ruler
set tabstop=4
syntax on

set expandtab
set autoindent

set iminsert=0
set imsearch=0

" Борьба с раскладкой, начало
"" Автоматически переключать на английскую раскладку в NORMAL-режиме
"" Позволяет нормально пользоваться vim без необходимости постоянно переключать раскладки
set langmap=фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ
let s:TO_ENG = 'xkbswitch -s com.apple.keylayout.ABC'
" autocmd CmdlineLeave * call system(s:TO_ENG) " При выходе из командного режима
" autocmd CmdlineEnter * call system(s:TO_ENG) " При входе в командный режим
autocmd ModeChanged *:n call system(s:TO_ENG) " При входе в NORMAL – английский
" autocmd InsertLeave * call system(s:TO_ENG)  " При выходе из INSERT – английский
" Борьба с раскладкой, конец

" Команды
command! -nargs=1 Glow vnew | terminal glow -t <args>

