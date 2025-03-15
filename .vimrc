set tabstop=4
set expandtab
set autoindent
syntax on
set keymap=russian-jcukenmac
set iminsert=0
set imsearch=0

" Автоматически переключать на английскую раскладку в NORMAL-режиме
" Позволяет нормально пользоваться vim без необходимости постоянно переключать раскладки
let s:TO_ENG = 'xkbswitch -s com.apple.keylayout.ABC'
autocmd InsertLeave * call system(s:TO_ENG)  " При выходе из INSERT – английский
"

