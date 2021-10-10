-- Enable Git signs in the window gutter
require('packer').use({
  'https://github.com/lewis6991/gitsigns.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = function ()
    require('gitsigns').setup()
  end
})
