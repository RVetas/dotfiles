""" Markdown
autocmd FileType markdown nmap gd va[y:tag <C-r>"<CR>
autocmd FileType markdown nmap gp :call GlowPreview()<CR> 
" autocmd FileType markdown set spell spelllang=en_us,ru spellsuggest=best,5
function! GlowPreview()
  let name = '__glow_preview__'

  " Проверим, есть ли уже такой буфер
  for i in range(1, bufnr('$'))
    if bufexists(i) && bufname(i) ==# name
      " Найдём окно с этим буфером и закроем
      for w in range(1, winnr('$'))
        if winbufnr(w) == i
          execute w . 'wincmd c'
          break
        endif
      endfor
      break
    endif
  endfor

  " Открываем превью в терминале
  " execute 'vert term glow ' . fnameescape(expand('%'))
  let filename = fnameescape(expand('%'))
  execute 'terminal ++curwin glow ' . filename 
  execute 'file ' . name
endfunction
"
" Эта функция - натягивание совы на глобус. Смотрим, что под курсором внутри
" [[здесь]]
" Если тег на мд-файл, то открываем буффер vim с ним.
" Если тег на картинку, то шлем iterm2-специфичную строку для inline
" отображения картинки.
" Но это не работает.
" function! GoToTagOrPreview()
"   " 1. Взять текст под курсором: [[TagName]]
"   normal! va[y
"   let tagname = getreg('"')
" 
"   " 2. Найти тег
"   let taginfo = taglist(tagname)
"   if empty(taginfo)
"     echo "Tag not found: " . tagname
"     return
"   endif
" 
"   let filepath = taginfo[0].filename
" 
"   " 3. Проверить расширение файла
"   let ext = fnamemodify(filepath, ":e")
" 
"   " 4. Если это изображение — открыть внешним просмотрщиком
"   if ext =~? 'png\|jpg\|jpeg\|gif\|webp'
"     "execute 'vert term imgcat ' . fnameescape(filepath)
" 	try
"       let raw = readfile(filepath, 'b')
"       let encoded = system('base64', join(raw, "\n"))
"       let image_escape = "\x1b]1337;File=inline=1:" . substitute(encoded, '\n', '', 'g') . "\x07\n"
"       call echoraw(image_escape)
"     catch
"       echo "Failed to read or encode image"
"     endtry
"   else
"     execute 'edit' filepath
"   endif
" endfunction

