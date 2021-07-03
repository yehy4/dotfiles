" Update packpath to find the location of plugins
exec 'set' 'packpath+=' . expand("<sfile>:p:h") . '/plugins'

if &loadplugins
  if has('packages')
    " Common plugins
    packadd! vim-oscyank
  endif
endif
