require('packer').use {
  'https://github.com/nvim-telescope/telescope.nvim',
  requires = {'https://github.com/nvim-lua/plenary.nvim'},
  config = function()
    local keymap = vim.api.nvim_set_keymap
    keymap('n', '<leader>tf', '<cmd>Telescope find_files theme=ivy<cr>', {noremap = true})
    keymap('n', '<leader>tg', '<cmd>Telescope live_grep theme=ivy<cr>', {noremap = true})
  end
}
