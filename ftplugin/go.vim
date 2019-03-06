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

