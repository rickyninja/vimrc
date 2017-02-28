" comment/uncomment blocks of code (in vmode)
vmap _c :s/^/#/gi<Enter>
vmap _C :s/^#//gi<Enter>

nnoremap <silent> _t :%!pythontidy<Enter>
vnoremap <silent> _t :!pythontidy<Enter>

setlocal autoindent
