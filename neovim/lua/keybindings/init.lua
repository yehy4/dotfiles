-- Use <leader>g to grep for an expression. This would usually be follow by :lw
vim.api.nvim_set_keymap('n', '<leader>g', ':silent lgrep! ', {noremap = true})
