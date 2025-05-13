""" Шорткаты
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>f <Plug>(go-fmt)
autocmd FileType go nmap <Leader>fs <Plug>(go-fill-struct)

""" Настройки
autocmd FileType go setlocal foldmethod=syntax

""" Настройки vim-go
" let g:go_test_timeout = '10s'          " таймаут тестов
let g:go_fmt_command = "goimports"       " какую утилиту использовать для форматирования
let g:go_addtags_transform = "camelcase" " какой кейс использовать при создании тегов (e.g. `json:...`)
let g:go_highlight_types = 1             " подсветка типов
let g:go_highlight_function_calls = 1    " подсветка вызова функций
let g:go_highlight_build_constraints = 1 " подсвечивать констрейнты сборки
let g:go_auto_type_info = 1              " 
let g:go_def_mode='gopls'                " откуда брать инфу для перехода к определению
let g:go_info_mode='gopls'               " откуда брать доку
let g:go_doc_popup_window = 1            " показывать GoDoc / Shift-K в попапе

""" Функции
function! s:build_go_files()             " сборка го-файлов вызывает go test или go build в зависимости от файла
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
