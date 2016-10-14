" Golang

let g:go_fmt_command = "goimports"
setlocal list
"setlocal listchars=eol:⏎,tab:\ \ 
setlocal listchars=tab:\ \ 

" comment/uncomment blocks of code (in vmode)
vmap _c :s/^/\/\//gi<Enter>
vmap _C :s/^\/\///gi<Enter>

" Add author attribution
nnoremap <silent> _p :put! =''<cr>:.!goattrib<cr>
vnoremap <silent> _p :put! =''<cr>:!goattrib<cr>

