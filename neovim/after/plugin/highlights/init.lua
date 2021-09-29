-- Highlight trailing whitespaces
vim.cmd('highlight TrailingSpaces ctermbg=yellow guibg=yellow')
vim.cmd('autocmd VimEnter,WinEnter * match TrailingSpaces /\\s\\+$/')
