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
