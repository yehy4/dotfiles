require('packer').use {
  'https://github.com/nvim-telescope/telescope.nvim',
  requires = {'https://github.com/nvim-lua/plenary.nvim'},
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>Telescope find_files<cr>', {noremap = true})
    vim.api.nvim_set_keymap('n', '<leader>tg', '<cmd>Telescope live_grep<cr>', {noremap = true})
  end
}
