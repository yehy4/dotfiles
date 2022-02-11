require('packer').use({
  'https://github.com/lewis6991/gitsigns.nvim',
  requires = {'https://github.com/nvim-lua/plenary.nvim'},
  config = function() require('gitsigns').setup() end
})
