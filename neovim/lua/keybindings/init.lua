-- Use <leader>g to grep for an expression.
vim.api.nvim_set_keymap('n', '<leader>g', ':silent grep!  | :cw<S-Left><S-Left><Left>', {noremap = true})
