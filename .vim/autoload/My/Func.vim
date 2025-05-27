" Файл содержит определение моих функций

" Определяет, есть ли видимые всплывающие окна
function! My#Func#HasVisiblePopup() 
    let winids = popup_list()
    if len(winids) == 0
        return v:false
    endif

    " Ignore hidden popups
    let prop = popup_getpos(winids[0])
    if prop.visible != 1
        return v:false
    endif

	return v:true
endfunction

function! My#Func#ScrollPopup(nlines)
    let winids = popup_list()
    if len(winids) == 0
        return
    endif

    " Ignore hidden popups
    let prop = popup_getpos(winids[0])
    if prop.visible != 1
        return
    endif

    let firstline = prop.firstline + a:nlines
    let buf_lastline = str2nr(trim(win_execute(winids[0], "echo line('$')")))
    if firstline < 1
        let firstline = 1
    elseif prop.lastline + a:nlines > buf_lastline
        let firstline = buf_lastline + prop.firstline - prop.lastline
    endif

    call popup_setoptions(winids[0], {'firstline': firstline})
	return "\<Ignore>"
endfunction

