" Go
" Override settings in vim-go.

setlocal nolist
"setlocal listchars=eol:⏎,tab:\ \
"setlocal listchars=tab:\ \

" comment/uncomment blocks of code (in vmode)
vmap _c :s/^/\/\//gi<Enter>
vmap _C :s/^\/\///gi<Enter>

" Add author attribution
nnoremap <silent> _p :put! =''<cr>:.!goattrib<cr>
vnoremap <silent> _p :put! =''<cr>:!goattrib<cr>

" override vim-go to make booleans look like builtins
syn keyword     goStatement          iota true false nil
hi def link     goStatement          Statement

" Enable vim-go leader keybinds
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>s <Plug>(go-implements)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>e <Plug>(go-rename)
au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <leader>rs <Plug>(go-run-split)
au FileType go nmap <leader>rv <Plug>(go-run-vertical)

" Personalized leader keybinds
" TODO find a way to run GoDeclsDir using <cword> as the search text
au FileType go nmap <leader>f :GoDeclsDir<cr>

" goimports uses heuristics and will sometimes remove needed imports
let g:go_fmt_command = "goimports"
au FileType go nmap <F10> :call GofmtToggle()<cr>

" Toggle between goimports and gofmt
function! GofmtToggle()
    if g:go_fmt_command == "goimports"
        let g:go_fmt_command = "gofmt"
    else
        let g:go_fmt_command = "goimports"
    endif
    echom "go_fmt_command set to " . g:go_fmt_command
endfunction
