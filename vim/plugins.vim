" Update packpath to find the location of plugins
execute 'set' 'packpath+=' . expand("<sfile>:p:h") . '/plugins'

if &loadplugins
  if has('packages')
    " Common plugins
    packadd! vim-oscyank    " OSC52-based yanking
    packadd! sonokai        " Theme
      if has('termguicolors')
          set termguicolors
      endif
      let g:sonokai_style = 'andromeda'
      colorscheme sonokai

      " Highlight trailing whitespaces
      highlight TrailingWhiteSpaces ctermbg=Yellow guibg=Yellow
      match TrailingWhiteSpaces /\s\+$/

      " Highlight current cursor number
      highlight CursorLineNr cterm=bold ctermfg=167 gui=bold guifg=#d75f5f

      " Modify status line colors to easily differentiate between active and
      " inactive windows
      highlight StatusLine cterm=bold ctermfg=167 ctermbg=239 gui=bold
        \ guifg=#d75f5f guibg=#4e4e4e
  endif
endif
