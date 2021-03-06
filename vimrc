nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Make Vim recognize XTerm escape sequences for Page and Arrow
" keys combined with modifiers such as Shift, Control, and Alt.
" See http://www.reddit.com/r/vim/comments/1a29vk/_/c8tze8p
if &term =~ '^screen'
  " Page keys http://sourceforge.net/p/tmux/tmux-code/ci/master/tree/FAQ
  execute "set t_kP=\e[5;*~"
  execute "set t_kN=\e[6;*~"

  " Arrow keys http://unix.stackexchange.com/a/34723
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained * set relativenumber
  autocmd BufLeave,FocusLost   * set norelativenumber
augroup END

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

set nofoldenable    " disable folding

" frequently switch windows, so make it a single key press.
nnoremap <silent> , <C-w>w
" frequently use Ctrl-W commands, reduce key presses.
nnoremap <silent> ; <C-w>
" backspace is difficult to map through lxc
"nnoremap <BS> :CtrlPBuffer<CR>
nnoremap <Enter> :CtrlPBuffer<CR>

" enable backspace to unindent, go to previous line, etc.
set backspace=indent,eol,start

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

" hide netrw file browser banner at top of buffer
let g:netrw_banner=0

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

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F9>


filetype plugin indent on

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

" Enable tab completion of our script names.
let scripts_dir = expand('~/.vim/scripts')
if index(split($PATH, ':'), scripts_dir) < 0
    call setenv('PATH', scripts_dir.':'.$PATH)
endif

" Enable pathogen
execute pathogen#infect()

