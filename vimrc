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
let g:ctrlp_match_window = 'min:4,max:25'

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

" location list & quickfix list helpers
nnoremap <expr> <tab> TabLists()
nnoremap <expr> <s-tab> ShiftTabLists()
nnoremap <expr> <leader>ll LocationListToggle()
nnoremap <expr> <leader>qf QuickFixToggle()

" automatically open quickfix or location list when there are results
" Having trouble getting this to open the quickfix in a split so I don't lose
" my original window.
"augroup listopen
"    autocmd!
"    autocmd QuickFixCmdPost [^l]* cwindow
"    autocmd QuickFixCmdPost l*    lwindow
"augroup END

function QuickFixToggle()
    if QuickFixIsOpen()
        " close and center cursor
        return ":cclose\<cr>zz"
    else
        " open and return cursor to previous buffer
        return ":copen\<cr>\<c-w>p"
    endif
endfunction

function LocationListToggle()
    if LocationListIsOpen()
        " close and center cursor
        return ":lclose\<cr>zz"
    else
        " open and return cursor to previous buffer
        return ":lopen\<cr>\<c-w>p"
    endif
endfunction

function TabLists()
    if LocationListIsOpen()
        return ":lnext\<cr>zz"
    elseif QuickFixIsOpen()
        return ":cnext\<cr>zz"
    else
        return "\<tab>"
    endif
endfunction

function ShiftTabLists()
    if LocationListIsOpen()
        return ":lprevious\<cr>zz"
    elseif QuickFixIsOpen()
        return ":cprevious\<cr>zz"
    else
        return  "\<s-tab>"
    endif
endfunction

" use visual bell instead of beeping
set vb

" ctags: look for a tags file in the directory of the current file then
" upward until /, also in the pwd then upward until /.
set tags=./tags;,tags;

set incsearch " highlight partial search matches
set ignorecase " ignorecase when searching
set nosmartcase " makes it harder to omnicomplete
set wildmenu
set wildmode=longest:full,full
set autoread " update buffers automatically when changing git branches

" syntax highlighting
syntax on

set smartindent

let g:is_bash = 1 " enable bash syntax highlight for ft=sh

" https://github.com/amix/vimrc/issues/635
" The error message when this isn't set is clear as mud, but this mutes it.
let g:snipMate = { 'snippet_version' : 1 }

" 4 space tabs
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set shiftround

" show matching brackets
set showmatch

colorscheme jeremys     " modified version of asu1dark

" don't highlight TODO text
highlight clear TODO
highlight link Todo Comment

" sets status line to display file format, type, current char ascii,hex codes, current cursor position
set laststatus=2                    " always show the status line
set statusline=%F%m%r%h%w\ line\ %l\ of\ %L\ (%p%%)\ col\ %v\ \ \ \%03.3b,0x\%02.2B

" dont use Q for Ex mode
map Q :q

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<F9>
set nopaste " off for supertab

let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest,preview

" autoclose the preview window that pops up during omnicomplete when done
" editing
augroup completion_preview_close
  autocmd!
  autocmd InsertLeave * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
augroup END

filetype plugin indent on
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

" git blame near cursor
nmap <leader>gb :execute "!git blame --date short -L" eval(line(".")-20) "%"<cr>

function LocationListIsOpen()
    return get(getloclist(0, {'winid':0}), 'winid', 0)
endfunction

function QuickFixIsOpen()
    for winnr in range(1, winnr('$'))
        if getwinvar(winnr, '&syntax') == 'qf'
            return 1
        endif
    endfor
    return
endfunction

" configure vim-lsp not to highlight words under cursor
let g:lsp_document_highlight_enabled = 0

" Enable tab completion of our script names.
let scripts_dir = expand('~/.vim/scripts')
if index(split($PATH, ':'), scripts_dir) < 0
    call setenv('PATH', scripts_dir.':'.$PATH)
endif

" Enable pathogen
execute pathogen#infect()

