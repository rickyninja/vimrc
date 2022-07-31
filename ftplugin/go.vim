if exists("b:loaded_go_vim")
  finish
endif
let b:loaded_go_vim = 1

if !exists(':Ginkgo')
    command! -n=? -buffer -complete=dir Ginkgo :call s:Ginkgo()
endif

function! s:Ginkgo()
    let cmd = "ginkgo -r"
    let job = job_start(cmd, {'out_io': 'buffer', 'out_name': 'ginkgobuf'})
    new
    buffer! ginkgobuf
    normal G
    AnsiEsc " use AnsiEsc.vim to interpret color codes
endfunction

" case insensitive search for omnicomplete
let g:go_code_completion_icase = 1
" auto run go build and open quickfix on first error
autocmd BufWritePost * silent make! | silent redraw! | cwindow |
 \ if QuickFixIsOpen() | crewind | endif
