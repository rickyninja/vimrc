" 4 space tabs
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4
setlocal shiftround

" check perl code with :make
setlocal makeprg=perl\ -c\ %\ $*
setlocal errorformat=%f:%l:%m
setlocal autowrite

" comment/uncomment blocks of code (in vmode)
vmap _c :s/^/#/gi<Enter>
vmap _C :s/^#//gi<Enter>

let b:perl_include_pod = 1            " my perl includes pod
let b:perl_extended_vars = 1          " syntax color complex things like @{${"foo"}}
let b:perl_sync_dist = 2500           " use more context for highlighting
let b:perl_want_scope_in_variables = 1

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

" Deparse obfuscated code
nnoremap <silent> _d :.!perl -MO=Deparse 2>/dev/null<cr>
vnoremap <silent> _d :!perl -MO=Deparse 2>/dev/null<cr>

" Add Perl POD boilerplate
nnoremap <silent> _p :.!pod<cr>
vnoremap <silent> _p :!pod<cr>

" This is for perldoc.vim
setlocal iskeyword +=_ iskeyword +=:
setlocal <F1>=[11~
map <F1> :Perldoc<cword><CR>
"setf perl
let g:perldoc_program='/usr/local/bin/perldoc'
source $HOME/.vim/ftplugin/perl_doc.vim

" This is for taglist
let b:Tlist_Inc_Winwidth = 0
setlocal <F3>=[13~
map <F3> :Tlist<CR>
let b:tlist_perl_settings='perl;u:use;p:package;r:role;e:extends;c:constant;a:attribute;s:subroutine;l:label'

setlocal list
"set listchars=eol:¬,tab:▸\
"setlocal listchars=eol:⏎,tab:¬¬,trail:␠,nbsp:⎵
setlocal listchars=tab:¬¬
