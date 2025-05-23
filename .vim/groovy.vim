augroup GroovySettings
	au!
	autocmd FileType groovy call SetupGroovy()
	autocmd FileType groovy call SetupGroovyMappings()
augroup END


function! SetupGroovy()
	" Ищем build.gradle вверх по директориям
	let l:build_file = findfile('build.gradle', '.;')

	if !empty(l:build_file)
		" Если нашли, используем gradle
		setlocal makeprg=gradle\ build
	else
		" Иначе — groovyc напрямую
		setlocal makeprg=groovyc\ --compile-static\ --type-checked\ %
	endif

	setlocal errorformat=%E%f:\ %l:\ %m
	setlocal foldmethod=syntax
	call SetupGroovyMappings()
endfunction

function! SetupGroovyMappings()
	nmap <leader>b :make<CR>:copen<CR>
	nmap <leader>r :!groovy --compile-static --type-checked %<CR>
endfunction
