let g:currentmode={
       \ 'n'  : 'NORMAL',
       \ 'v'  : 'VISUAL',
       \ 'V'  : 'VISUAL LINE',
       \ "\<C-V>" : 'VISUAL BLOCK',
       \ 'i'  : 'INSERT',
       \ 'R'  : 'REPLACE',
       \ 'Rv' : 'VIRTUAL REPLACE',
       \ 'c'  : 'COMMAND',
       \ 'r'  : 'PROMPT',
       \}

" Do not display mode because it will be shown in the status line
set noshowmode

" Clear out status line
set statusline=

" Display current mode
set statusline+=\ %{toupper(g:currentmode[mode()])}

" Display file path relative to current working directory
" %f should be sufficient but it only works after splits for some reason...
" set statusline+=\ \ %f
set statusline+=\ \ %{fnamemodify(expand('%'),':.')}

" Display hints on the file status
set statusline+=%{&modified?'\ [+]':''}
set statusline+=%{&readonly?'\ []':''}

" Separate left- and right-aligned items
set statusline+=%=

" Display filetype
set statusline+=\ [%{&filetype!=#''?&filetype:'none'}]

" Display file encoding
set statusline+=\ [%{&fileencoding}]

" Location of cursor line
set statusline+=\ [%l:%c/%L]
