if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

" override makeprg to also use -x to shellcheck files included via source
setlocal makeprg=shellcheck\ -f\ gcc\ -x
" auto run shellcheck and open quickfix on first error
"autocmd BufWritePost * silent make! <afile> | silent redraw! | cwindow |
" \ if QuickFixIsOpen() | crewind | endif

setlocal keywordprg=:Shelldoc

if !exists(':Shelldoc')
  command! -n=? -buffer -complete=dir Shelldoc :call s:Shelldoc('<args>')
endif

function! s:Shelldoc(subject)
    let s:cmd = 'help ' . a:subject
    20new
    silent! execute ":0r !" . s:cmd
    execute ":0"
    if getline('.') =~ 'help: no help topics match'
        normal ggdG
        let s:cmd = 'man ' . a:subject
        silent! execute ":0r !" . s:cmd
        execute ":0"
        if getline('.') =~ 'No manual entry for'
            normal yy
            quit!
            redraw
            echomsg @"
        endif
    endif

  setlocal nomodified
  setlocal readonly
endfunction

function! s:Openpane(cmd)
endfunction
