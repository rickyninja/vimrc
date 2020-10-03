setlocal tabstop=8
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab

" LspDefinition is superior to ctags if you have python-language-server
" installed.
nnoremap <buffer> <silent> <C-]> :LspDefinition<cr>
