nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" otherwise ctrlp never finds what I'm looking for
let g:ctrlp_max_files=0
" show longer listing in search results. It will max out at window height.
let g:ctrlp_match_window = 'min:4,max:999'

" use Enter to select items in location list
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
" restore Enter to ctrlp buffer when leaving location list
autocmd CmdwinLeave * nnoremap <Enter> :CtrlPBuffer<CR>
" use Enter to select items in quickfix list
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" restore Enter to ctrlp buffer when leaving quickfix list
autocmd BufLeave * nnoremap <Enter> :CtrlPBuffer<CR>

nnoremap <silent> _m :%!format-md-table.pl<Enter>
vnoremap <silent> _m :!format-md-table.pl<Enter>

" frequently switch windows, so make it a single key press.
nnoremap <silent> , <C-w>w
" frequently use Ctrl-W commands, reduce key presses.
nnoremap <silent> ; <C-w>
" backspace is difficult to map through lxc
"nnoremap <BS> :CtrlPBuffer<CR>
nnoremap <Enter> :CtrlPBuffer<CR>

" location list shortcuts
nmap <Home> :lp<cr>
nmap <End> :lne<cr>

" use visual bell instead of beeping
set vb

" ctags: look for a tags file in the directory of the current file then
" upward until /, also in the pwd then upward until /.
set tags=./tags;,tags;

" incremental search | ignorecase when searching
set incsearch
set ignorecase

" syntax highlighting
syntax on

" autoindent
"autocmd FileType perl set autoindent|set smartindent
set smartindent

" 4 space tabs
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set shiftround

" show matching brackets
set showmatch

colorscheme jeremys     " modified version of asu1dark

" sets status line to display file format, type, current char ascii,hex codes, current cursor position
set laststatus=2                    " always show the status line
set statusline=%F%m%r%h%w\ line\ %l\ of\ %L\ (%p%%)\ col\ %v\ \ \ \%03.3b,0x\%02.2B

" check perl code with :make
"autocmd FileType perl set makeprg=perl\ -c\ %\ $*
"autocmd FileType perl set errorformat=%f:%l:%m
"autocmd FileType perl set autowrite
"autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" dont use Q for Ex mode
map Q :q

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F9>


filetype plugin on

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" split window resizing; resize current buffer by +/- 5 
nnoremap <C-left> :vertical resize -5<cr>
nnoremap <C-down> :resize +5<cr>
nnoremap <C-up> :resize -5<cr>
nnoremap <C-right> :vertical resize +5<cr>

" Template toolkit
nnoremap <silent> <F12> :set syntax=tt2<cr>
au BufNewFile,BufRead *.tt2 setf tt2

set modeline
set modelines=5
  
nmap <leader>l :set invlist<cr>
"set list
"set listchars=eol:¬,tab:▸\
"set listchars=eol:⏎,tab:¬¬,trail:␠,nbsp:⎵
"au FileType go set listchars+=tab:\ \ 

" Enable pathogen
execute pathogen#infect()

