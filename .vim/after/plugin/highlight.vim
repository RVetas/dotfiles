"""""" Цветовая схема устанавливается в зависимости от схемы MacOS
let g:xcodehc_emph_types = 0
let g:xcodehc_dim_punctuation = 0

colorscheme xcodehc

if system('osascript -e "tell application \"System Events\" to tell appearance preferences to return dark mode"') =~ "true"
	let $BAT_THEME = "base16" " установка цветовой схемы bat для fzf
else
	let $BAT_THEME = "ansi"
endif

highlight CocInlayHint ctermbg=NONE ctermfg=DarkGrey
highlight CocErrorVirtualText ctermbg=NONE ctermfg=Red
highlight CocFadeOut ctermbg=4

highlight SpellBad term=reverse ctermbg=224 gui=undercurl guisp=Red
highlight SpellCap term=reverse ctermbg=81 gui=undercurl guisp=Blue
highlight SpellLocal term=underline ctermbg=39 gui=undercurl guisp=DarkCyan
highlight SpellRare term=reverse ctermbg=225 gui=undercurl guisp=Magenta
