" HTML

" Переход к следующему html-тегу
autocmd FileType html nnoremap ]] :<C-u>call search('<[a-zA-B0-9]', 'sWz')<CR>
" Переход к предыдущему html-тегу
autocmd FileType html nnoremap [[ :<C-u>call search('<[a-zA-B0-9]', 'bsWz')<CR>
