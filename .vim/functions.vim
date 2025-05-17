" Считает сумму чисел в файле, в котором каждая строка представляет число
" Результат попадает в системный буфер обмена
function! SumBufferToClipboard()
  let lines = getline(1, '$')
  let total = eval(join(map(lines, 'str2float(v:val)'), '+'))
  let @+ = string(total)
endfunction

function! InsertFinancialSumLine()
  let sum = 0.0
  for lnum in range(1, line('.'))
    let nums = matchlist(getline(lnum), '\v.*\|.*\|.*(\d+)')
    for match in split(getline(lnum), '\s\+')
      if match =~ '^\d\+$'
        let sum += str2float(match)
      endif
    endfor
  endfor

  let total_line = printf('| Итого%s| %.0f |', repeat(' ', 46), sum)
  call append(line('.'), total_line)
endfunction
