" Настройки YouCompleteMe

"packadd YouCompleteMe

" Подсветка
highlight YcmErrorText ctermbg=NONE ctermfg=Red guibg=NONE  guifg=#ffd7d7

" Шорткаты
let g:ycm_use_ultisnips_completer = 1                   " использовать UltiSnips сниппеты
let g:ycm_enable_inlay_hints = 1                        " хинты внутри, экспериментальная фича
let g:ycm_min_num_of_chars_for_completion = 1           " подсказки начинаются с одного набранного символа
let g:ycm_error_symbol = '>'                           " какой символ показывается при error
let g:ycm_warning_symbol = '!'                         " какой символ показывается при warning
let g:ycm_echo_current_diagnostic = 'virtual-text'      " как показывать диагностические данные
let g:ycm_clear_inlay_hints_in_insert_mode = 1          " убирает хинты при переходе в режим редактирования
nnoremap <silent> <leader>h <Plug>(YCMToggleInlayHints) 
let g:ycm_add_preview_to_completeopt="popup"            " превью комплитера показывается поп-апом
source /Users/rvetas/dev/personal/other/lsp-examples/vimrc.generated " добавляет поддержку groovy, ruby, docker
" переопределил черный список файлов, чтобы убрать из него markdown
let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'netrw': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'leaderf': 1,
      \ 'mail': 1
      \}

