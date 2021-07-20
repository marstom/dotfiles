function! Hello(...) abort
    " let a = system('ls')
    echo a:0
    echo a:1
    echo a:2
endfunction


function! SuperTab()
  let l:part = strpart(getline('.'),col('.')-2,1)
  if (l:part=~'^\W\?$')
      return "\<Tab>"
  else
      return "\<C-n>"
  endif
endfunction

imap <Tab> <C-R>=SuperTab()<CR>
command! Hell call Hello()

"
"
"
"
"

