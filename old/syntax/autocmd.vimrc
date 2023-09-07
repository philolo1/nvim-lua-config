autocmd StdinReadPre * let s:std_in=1
autocmd BufNewFile,BufRead *.py setlocal shiftwidth=2
autocmd! BufWritePre * :DeleteMultipleLines
autocmd! BufWritePre * :DeleteMultipleLines2
au BufRead,BufNewFile Fastfile setfiletype ruby

" Save folder when not existent
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
  augroup END


" au BufNewFile,BufRead *.js set filetype=css.javascript | set syntax=javascript
" au BufNewFile,BufRead *.jsx set filetype=css.javascript | set syntax=javascript
