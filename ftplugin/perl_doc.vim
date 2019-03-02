" Vim FT Plugin

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

if &keywordprg == '' | setlocal keywordprg=perldoc | endif   " See ':help K'
setlocal iskeyword=a-z,A-Z,48-57,:,_,/,. " Adds / and . as used in requires.

if !exists(':Perldoc')
  command! -n=? -buffer -complete=dir Perldoc :call s:Perldoc('<args>')
endif

"---
" Start the perldoc using the preferences from the global variables
"
function! s:Perldoc(perldoc)
  " set perldoc if not set
  let s:perldoc = a:perldoc

  " check got value
  if s:perldoc == ''
    echomsg 'What Perldoc Page do you want?'
    return
  endif

  let s:line = getline('.')
  let s:cmd = 'perldoc -t '
  " Double colon seems like the simplest way to match a module, except for the
  " ones that are one word, like Carp.  Prioitize the word under the cursor,
  " but fallback to checking for use & require.
  if s:perldoc !~ '::' && s:line !~ '^use' && s:line !~ '^\s\+require'
    let s:cmd .= '-f '
  endif
  let s:cmd .= s:perldoc
  20new
  silent! execute ":0r !" . s:cmd
  execute ':0'

  if match(getline('.'), '^No documentation for ') >= 0
    normal yy
    quit!
    redraw
    echomsg @"
    return
  endif

  " Clean up the formatting a little:
  setlocal nomodified
  setlocal readonly
  setlocal filetype=podman

endfunction
