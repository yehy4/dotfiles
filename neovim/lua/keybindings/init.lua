-- Use <leader>g to grep for an expression. This would usually be follow by :lw
vim.api.nvim_set_keymap('n', '<leader>g', ':silent lgrep! ', {noremap = true})

-- Use <leader>t to toggle netrw
vim.api.nvim_set_keymap('n', '<leader>t', ':Lexplore<cr>', {noremap = true})
