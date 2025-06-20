"""""" Цветовая схема устанавливается в зависимости от схемы MacOS
if system('osascript -e "tell application \"System Events\" to tell appearance preferences to return dark mode"') =~ "true"
	colorscheme Tomorrow-Night
	highlight CursorLine ctermbg=234
	highlight ColorColumn ctermbg=234
	let $BAT_THEME = "base16" " установка цветовой схемы bat для fzf
else
	colorscheme Tomorrow
	highlight CursorLine ctermbg=255
	highlight ColorColumn ctermbg=255
	let $BAT_THEME = "ansi"
endif

highlight! link CursorLineNr LineNr " Выключает подсветку номера текущей строки
highlight Error ctermbg=NONE ctermfg=Red guibg=NONE guifg=#ffd7d7
highlight SpellBad ctermbg=NONE ctermfg=Red guibg=NONE guifg=#ffd7d7
highlight CocInlayHint ctermbg=NONE ctermfg=DarkGrey
highlight CocErrorVirtualText ctermbg=NONE ctermfg=Red
highlight CocFadeOut ctermbg=LightYellow

highlight swiftIdentifierKeyword ctermfg=97
highlight swiftKeyword ctermfg=97
highlight swiftVarName ctermfg=fg
