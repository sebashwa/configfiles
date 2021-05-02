function! ElixirDocFolds()
  let thisline = getline(v:lnum)
  if match(thisline, '^\W*@doc\|@moduledoc') >= 0
    return ">1"
  elseif match(thisline, '^\W*"""') >= 0
    return "<1"
  else
    return "="
  endif
endfunction

setlocal foldmethod=expr
setlocal foldexpr=ElixirDocFolds()
