" Enable Vim-specific features not compatible with VI
set nocompatible

" Enables "enhanced mode" of command-line completion. Show menu upon tab.
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Use incremental search
set incsearch

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Reload files if they have changed outside of Vim and their buffer in Vim is
" unmodified
set autoread

" Use relative line numbers for all lines but show absolute line number for
" the current line
set number relativenumber

" Use 1 tab = 2 spaces
set shiftwidth=2
set softtabstop=2
set expandtab 

" Enable code folding based on indent level
set foldmethod=indent

" Ensure code is not folded by default when opening a file
set nofoldenable

" Explicitly set background color to prevent color scheme differences inside
" and outside tmux
set background=dark

" Set color scheme
colorscheme pablo

" Attempt to determine the type of a file based on its name and possibly its
" contents. Allow intelligent auto-indenting for each filetype, and for 
" plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

