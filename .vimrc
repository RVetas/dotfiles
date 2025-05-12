"""""" Плагины
filetype plugin indent on
"packadd YouCompleteMe
"""""" Общее
set updatetime=500                  " Скорость обновления vim
set tags=tags;/ 					" Ищет теги во всех директориях до рута
set tags+=tags,./tags               " Где искать теги
set noexpandtab                     " Не превращать табы в пробелы
set autoindent                      " Автоматический отступ
set autowrite                       " Автоматически сохраняет файл при использовании :make
set splitright                      " открывать сплиты справа
set foldmethod=marker
set viewoptions-=curdir             " Убирает сохранение директории при сохранении view
set showcmd                         " Показывает текущую команду в статусбаре
set ignorecase                      " Игнорирует кейс при поиске
set smartcase                       " Если в поиске есть заглавные буквы, затирает ignorecase
autocmd InsertLeave,FocusLost * if &modifiable && &modified | silent! write | endif
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview
autocmd FileType go setlocal foldmethod=syntax
"""""" Параметры отображения
set hlsearch                        " Подсвечивать результаты поиска
set number                          " Показывать номера строк
set ruler                           " Указатель на строку и символ в правом нижнем углу
set tabstop=4                       " Количество пробелов в табе
set shiftwidth=4                    " Количество пробелов в одном уровне отступа
set cursorline                      " Подсвечивать строку, на которой находится курсор
set colorcolumn=120                 " Вертикальная полоса, отмеряющая 120 символов
syntax on                           " Подсветка синтаксиса
set scrolloff=15					" Сколько строк оставлять вокруг курсора при скролле 
set smoothscroll
set scroll=5                        " Сколько строк прокручивать при скролле Ctrl-d, Ctrl-u
set signcolumn=yes                  " Показывать колонку знаков (используется плагинами)
"""""""""""" Настройки курсора
let &t_EI .= "\e[1 q"               " Normal (линейный курсор)
let &t_SI .= "\e[1 q"               " Insert (блочный курсор)
let &t_SR .= "\e[1 q"               " Visual (стандартный курсор)

"""""" Цветовая схема устанавливается в зависимости от схемы MacOS
if system('osascript -e "tell application \"System Events\" to tell appearance preferences to return dark mode"') =~ "true"
	colorscheme Tomorrow-Night
	let $BAT_THEME = "base16" " установка цветовой схемы bat для fzf
else
	colorscheme Tomorrow
	let $BAT_THEME = "ansi"
endif
highlight! link CursorLineNr LineNr " Выключает подсветку номера текущей строки
highlight YcmErrorText ctermbg=NONE ctermfg=Red guibg=NONE  guifg=#ffd7d7
highlight Error ctermbg=NONE ctermfg=Red guibg=NONE guifg=#ffd7d7
highlight SpellBad ctermbg=NONE ctermfg=Red guibg=NONE guifg=#ffd7d7
highlight CocInlayHint ctermbg=NONE ctermfg=DarkGrey
highlight CocErrorVirtualText ctermbg=NONE ctermfg=Red

"""""" Борьба с раскладкой
"" Автоматически переключать на английскую раскладку в NORMAL-режиме
"" Позволяет нормально пользоваться vim без необходимости постоянно переключать раскладки
set langmap=фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ
let s:TO_ENG = 'xkbswitch -s com.apple.keylayout.ABC'
set iminsert=1
set imsearch=0

"""""" Настройки vim-go
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
""""""" Функции
function! s:build_go_files()             " сборка го-файлов вызывает go test или go build в зависимости от файла
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
""""""" Шорткаты
map <Leader>s :nohl<CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
""" Перемещение выделенных строк или строки под курсором
""" Странные символы из-за MacOS, они означают Alt-J и Alt-K
nnoremap ∆ :m .+1<CR>== 
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv
""" Golang
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>f <Plug>(go-fmt)
autocmd FileType go nmap <Leader>fs <Plug>(go-fill-struct)

""" Markdown
autocmd FileType markdown nmap gd va[y:tag <C-r>"<CR>
autocmd FileType markdown nmap gp :call GlowPreview()<CR> 
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

""" HTML
" Переход к следующему html-тегу
autocmd FileType html nnoremap ]] :<C-u>call search('<[a-zA-B0-9]', 'sWz')<CR>
" Переход к предыдущему html-тегу
autocmd FileType html nnoremap [[ :<C-u>call search('<[a-zA-B0-9]', 'bsWz')<CR>

"""""" Настройки YouCompleteMe
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

"""""" Настройки UltiSnips
let g:UltiSnipsExpandTrigger = '<C-e>'                        " Ctrl-e : раскрыть сниппет
let g:UltiSnipsJumpForwardTrigger = '<C-j>'                   " Ctrl-j : пройти вперед по сниппету
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'                  " Ctrl-k : пройти назад по сниппету
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"] " В каких папках искать сниппеты

"""""" Настройки CtrlP
let g:ctrlp_root_markers = ["go.mod", ".ctrlp_root"] " Добавляет go.mod в качестве маркера корневой директории

"""""" Подключаем fzf
set rtp+=/opt/homebrew/opt/fzf
nmap <C-s> :FZF<CR>

"""""" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1

""""" CoC
"autocmd InsertEnter * :CocCommand document.disableInlayHint
"autocmd InsertLeave * :CocCommand document.enableInlayHint
let g:coc_global_extensions = ['coc-json', 'coc-go', 'coc-html', 'coc-sh', 'coc-docker', 'coc-sourcekit', 'coc-snippets', 'coc-solargraph']
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" note: use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo навигация по коду
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')


""""" Swift 
function! InsertHeaderIfEmpty()
  if line('$') == 1 && getline(1) == ''
    let l:author = substitute(system('git config user.name'), '\n', '', '')
    let l:date = strftime("%d/%m/%Y")
    call append(0, '// Created by ' . l:author . ' on ' . l:date)
  endif
endfunction

augroup FileHeader
  autocmd!
  autocmd BufNewFile,BufReadPost *.swift,*.groovy call InsertHeaderIfEmpty()
augroup END
