" goto definition of std c lib functions.
" ~/.tags.c is manually generated via ctags-c script
set tags+=~/.tags.c

" Configure vim-lsp to use clangd language server.
"
" I installed clangd via apt with sources info from https://apt.llvm.org/.
" I'm making note of this because it took too long to find this page.
" The llvm.sh script from that page shows where to get the gpg key
" apt needs to be able to update and install.
"
" You'll need to generate a compile_commands.json file for the project.  I did
" this with compiledb make; pip install compiledb.  I tested this with ices
" source.  I wasn't able to generate compile_commands.json until I compiled &
" installed libshout.  It would be a lot nicer if you were able to point to
" libshout sources without having to install libshout to the system.  I'm not
" sure if this is a problem specific to ices and the way it doesn't vendor
" it's depends, or if this is common in C projects.
"
" I'm also not able to goto defintion of libshout functions, it takes me to
" the shout.h function declaration, not the implementation in shout.c.  This
" is probably because the shout.c file is not installed, only the shared
" object file is installed.
if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'clangd',
            \ 'cmd': {server_info->['clangd']},
            \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
            \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

nnoremap <buffer> <silent> <C-]> :LspDefinition<cr>
setlocal keywordprg=:LspHover
