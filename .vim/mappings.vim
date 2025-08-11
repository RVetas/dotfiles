" Шорткаты
map <Leader>s :nohl<CR>
map <Leader>n :cnext<CR>
map <Leader>p :cprevious<CR>
nnoremap <Leader>c :call ToggleQuickFixWindow()<CR>

function! ToggleQuickFixWindow() abort 
	let windows = filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')
	if empty(windows)
		execute 'cwindow'
	else
		execute 'cclose'
	endif
endfunction

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

nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
