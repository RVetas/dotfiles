"""""" Цветовая схема устанавливается в зависимости от схемы MacOS
let g:xcodehc_emph_types = 0
let g:xcodehc_dim_punctuation = 0

colorscheme xcodehc

if system('osascript -e "tell application \"System Events\" to tell appearance preferences to return dark mode"') =~ "true"
	let $BAT_THEME = "base16" " установка цветовой схемы bat для fzf
else
	let $BAT_THEME = "ansi"
endif

" highlight! link CursorLineNr LineNr " Выключает подсветку номера текущей строки
" highlight Error ctermbg=NONE ctermfg=Red guibg=NONE guifg=#ffd7d7
" highlight SpellBad ctermbg=NONE ctermfg=Red guibg=NONE guifg=#ffd7d7
highlight CocInlayHint ctermbg=NONE ctermfg=DarkGrey
highlight CocErrorVirtualText ctermbg=NONE ctermfg=Red
highlight CocFadeOut ctermbg=LightYellow

" highlight swiftVarName ctermfg=fg
