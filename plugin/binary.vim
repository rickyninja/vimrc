" If one has a particular extension that one uses for binary files (such as exe,
" bin, etc), you may find it helpful to automate the process with the following
" bit of autocmds for your <.vimrc>.  Change that "*.bin" to whatever
" comma-separated list of extension(s) you find yourself wanting to edit:

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin,*.d2s let &bin=1
  au BufReadPost *.bin,*.d2s if &bin | %!xxd
  au BufReadPost *.bin,*.d2s set ft=xxd | endif
  au BufWritePre *.bin,*.d2s if &bin | %!xxd -r
  au BufWritePre *.bin,*.d2s endif
  au BufWritePost *.bin,*.d2s if &bin | %!xxd
  au BufWritePost *.bin,*.d2s set nomod | endif
augroup END
