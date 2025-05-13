augroup GroovySettings
	au!
	autocmd FileType groovy setlocal makeprg=groovyc\ --compile-static\ --type-checked\ %
	autocmd FileType groovy setlocal errorformat=%E%f:\ %l:\ %m
    autocmd FileType groovy setlocal foldmethod=syntax
	autocmd FileType groovy call SetupGroovyMappings()
augroup END

function! SetupGroovyMappings()
	nmap <leader>b :make<CR>:copen<CR>
	nmap <leader>r :!groovy --compile-static --type-checked %<CR>
endfunction
