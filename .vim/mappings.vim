" Шорткаты
map <Leader>s :nohl<CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Перемещение выделенных строк или строки под курсором
" Странные символы из-за MacOS, они означают Alt-J и Alt-K
nnoremap ∆ :m .+1<CR>== 
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Маппинги, отвечающие за скролл внутри всплывающих окон в случае их наличия
nnoremap <silent><nowait><expr> <C-d> My#Func#HasVisiblePopup() ? My#Func#ScrollPopup(3) : "5\<C-d>"
nnoremap <silent><nowait><expr> <C-u> My#Func#HasVisiblePopup() ? My#Func#ScrollPopup(-3) : "5\<C-u>"
inoremap <silent><nowait><expr> <C-d> My#Func#HasVisiblePopup() ? My#Func#ScrollPopup(3) : "5\<C-d>"
inoremap <silent><nowait><expr> <C-u> My#Func#HasVisiblePopup() ? My#Func#ScrollPopup(-3) : "5\<C-u>"

