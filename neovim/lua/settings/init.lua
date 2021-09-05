-- Use case insensitive search, except when using capital letters
vim.o.ignorecase = true
vim.o.smartcase = true

-- Instead of failing a command because of unsaved changes, create a
-- dialogue asking if you wish to save changed files.
vim.o.confirm = true

-- Allow having multiple unsaved buffers in the same window
vim.o.hidden = true

-- Use relative line numbers for all lines but show absolute line number for
-- the current line
vim.o.number = true
vim.o.relativenumber = true

-- Use 1 tab = 2 spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Enable code folding based on indent level
vim.o.foldmethod = 'indent'

-- Ensure code is not folded by default when opening a file
vim.o.foldenable = false

-- Split window below/right when creating new horizontal/vertical windows
vim.o.splitbelow = true
vim.o.splitright = true

-- Disable swap file creation
vim.o.swapfile = false

-- Show cursor line
vim.o.cursorline = true

-- Show line length limit columns
vim.o.colorcolumn = '81,101'

-- Prevent addition of two spaces after certain characters (period, for example)
-- when joining lines
vim.o.joinspaces = false

-- Keep a few lines when scrolling off the page
vim.o.scrolloff = 3

-- Search into subfolders recursively to provide tab completion for filenames
vim.o.path = '**'

-- Disable modeline due to security concerns
vim.o.modeline = false

-- Use ripgrep when searching using :grep or :lgrep
vim.o.grepprg = 'rg --vimgrep --smart-case'

-- Disable timeout when waiting for a sequence of keystrokes
vim.o.timeout = false

-- Disable shared data usage because it slows down quitting
vim.o.shada = ''

-- Display popup menu for completion even when there is only one match.
-- Show information about each completion item in preview window if available.
vim.o.completeopt = 'menuone,preview,noselect'
