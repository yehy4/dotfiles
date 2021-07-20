-- Highlight trailing whitespaces
vim.cmd('highlight TrailingSpaces ctermbg=yellow guibg=yellow')
vim.cmd('match TrailingSpaces /\\s\\+$/')
