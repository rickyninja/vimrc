" Go
" Override settings in vim-go.

let g:go_fmt_command = "goimports"
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
syn keyword     goBuiltins           iota true false nil

" location list shortcuts
nmap <Home> :lp<cr>
nmap <End> :lne<cr>

" Enable vim-go leader keybinds
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
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
