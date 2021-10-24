-- Use custom theme
require('packer').use({
  'https://github.com/glepnir/zephyr-nvim',
  config = function() vim.cmd('colorscheme zephyr') end
})
