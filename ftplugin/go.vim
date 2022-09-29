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
"autocmd BufWritePost * silent make! | silent redraw! | cwindow |
" \ if QuickFixIsOpen() | crewind | endif
"autocmd BufWritePost * :GoBuild
"
" syntax highligting
let g:go_highlight_structs = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
" Enabling variable declarations or assignments is too much color.
"let g:go_highlight_variable_declarations = 1
"let g:go_highlight_variable_assignments = 1
