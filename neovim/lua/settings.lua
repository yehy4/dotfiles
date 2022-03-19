-- Enable 24-bit colors.
vim.o.termguicolors = true

-- Use case insensitive search, except when using capital letters.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Instead of failing a command because of unsaved changes, create a dialogue asking if you wish to
-- save changed files.
vim.o.confirm = true

-- Use relative line numbers for all lines but show absolute line number for the current line.
vim.o.number = true
vim.o.relativenumber = true

-- Use 1 tab = 2 spaces.
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Ensure indents are rounded to a multiple of shiftwidth.
vim.o.shiftround = true

-- Ensure code is not folded by default when opening a file.
vim.o.foldenable = false

-- Split window below/right when creating new horizontal/vertical windows.
vim.o.splitbelow = true
vim.o.splitright = true

-- Disable swap file creation.
vim.o.swapfile = false

-- Show cursor line.
vim.o.cursorline = true

-- Show line length limit columns.
vim.o.colorcolumn = '81,101'

-- Keep a few lines when scrolling off the page.
vim.o.scrolloff = 3

-- Search into subfolders recursively to provide tab completion for filenames.
vim.o.path = '**'

-- Disable modeline due to security concerns.
vim.o.modeline = false

-- Disable timeout when waiting for a sequence of keystrokes.
vim.o.timeout = false

-- Disable shared data usage because it slows down quitting.
vim.o.shada = ''

-- Display popup menu for completion even when there is only one match.
vim.o.completeopt = 'menu,menuone,noselect'

-- Indent wrapped lines and display an indicator before them.
vim.o.breakindent = true
vim.o.breakindentopt = 'sbr'
vim.o.showbreak = '↪ '
vim.o.linebreak = true -- Prevent a word from getting split into two.

-- Disable showing current mode below status line.
vim.o.showmode = false

-- Increase the speed at which CursorHold auto command fires.
vim.o.updatetime = 100

-- Enable mouse to prevent tmux from capturing mouse actions in neovim panes.
vim.o.mouse = "a"

-- Automatically resize windows when available area is changed (e.g. when the terminal window is
-- resized).
vim.cmd('autocmd VimResized * wincmd =')

-- Highlight trailing spaces.
vim.cmd('autocmd ColorScheme * highlight TrailingSpaces ctermbg=yellow guibg=yellow')
vim.cmd('autocmd VimEnter,WinEnter * match TrailingSpaces /\\s\\+$/')
