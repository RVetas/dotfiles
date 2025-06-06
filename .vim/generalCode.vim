augroup Code
	au!
	" Вертикальная полоса, отмеряющая 120 символов
	autocmd FileType groovy,swift,go call SetColorColumn() 
augroup END

function! SetColorColumn()
	let &colorcolumn=join(range(120,999),",")
endfunction


" Вставляет заголовок вида `// Created by <git.name> on <date>` 
function! InsertHeaderIfEmpty()
  if line('$') == 1 && getline(1) == ''
    let l:author = substitute(system('git config user.name'), '\n', '', '')
    let l:date = strftime("%d/%m/%Y")
    call append(0, '// Created by ' . l:author . ' on ' . l:date)
  endif
endfunction

augroup FileHeader
  autocmd!
  autocmd BufNewFile,BufReadPost *.swift,*.groovy,*.rb,*.jenkinsfile call InsertHeaderIfEmpty()
augroup END
