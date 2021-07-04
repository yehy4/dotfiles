" Update packpath to find the location of plugins
execute 'set' 'packpath+=' . expand("<sfile>:p:h") . '/plugins'

if &loadplugins
  if has('packages')
    " Common plugins
    packadd! vim-oscyank    " OSC52-based yanking
  endif
endif
