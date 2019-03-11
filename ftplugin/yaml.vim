" Vim indent file
" Language: Yaml
" Author: Ian Young

setlocal autoindent tabstop=2 softtabstop=2 shiftwidth=2 expandtab
setlocal indentkeys=o,O,*<Return>,!^F
setlocal indentkeys-=0# indentkeys-=<:>
setlocal backspace=indent " allow backspace over autoindent
" yaml is intolerant of tabs, so make them visible.
setlocal list listchars=tab:¬¬

if exists("b:did_indent")
  finish
endif

let b:did_indent = 1

setlocal indentexpr=GetYamlIndent()

function! GetYamlIndent()
  let prevlnum = v:lnum - 1
  if prevlnum == 0
    return 0
  endif
  let line = substitute(getline(v:lnum),'\s\+$','','')
  let prevline = substitute(getline(prevlnum),'\s\+$','','')

  let indent = indent(prevlnum)
  let increase = indent + &sw
  let decrease = indent - &sw

  if prevline =~ ':$'
    return increase
  " list of maps
  elseif prevline =~ '^\s\+\-\s\+[^:]\+:'
    return increase
  elseif prevline =~ '^\s\+\-' && line =~ '^\s\+[^-]\+:'
    return decrease
  else
    return indent
  endif
endfunction

" vim:set sw=2 ts=2 sts=2 et:
