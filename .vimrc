" Плагины
filetype plugin indent on
packadd YouCompleteMe
" Параметры отображения
set number
set ruler
set tabstop=4
set shiftwidth=4
syntax on
colorscheme Tomorrow-Night

set expandtab
set autoindent
set autowrite " автоматически сохраняет файл при использовании :make

set iminsert=0
set imsearch=0

set splitright " открывать сплиты справа

" Борьба с раскладкой, начало
"" Автоматически переключать на английскую раскладку в NORMAL-режиме
"" Позволяет нормально пользоваться vim без необходимости постоянно переключать раскладки
set langmap=фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ
let s:TO_ENG = 'xkbswitch -s com.apple.keylayout.ABC'
" autocmd CmdlineLeave * call system(s:TO_ENG) " При выходе из командного режима
" autocmd CmdlineEnter * call system(s:TO_ENG) " При входе в командный режим
" autocmd ModeChanged *:n call system(s:TO_ENG) " При входе в NORMAL – английский
" autocmd InsertLeave * call system(s:TO_ENG)  " При выходе из INSERT – английский
" Борьба с раскладкой, конец

" Команды
command! -nargs=1 Glow vnew | terminal glow -t <args>


" Настройки vim-go
" let g:go_test_timeout = '10s' " таймаут тестов
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_build_constraints = 1
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

" Настройки YouCompleteMe
" Шорткаты
let g:ycm_use_ultisnips_completer = 1
set completeopt-=preview " отключает сплит при показе подсказок

" Настройки UltiSnips
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
