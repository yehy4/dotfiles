-- Use custom theme
require('packer').use({
  'https://github.com/glepnir/zephyr-nvim',
  config = function() vim.cmd('colorscheme zephyr') end
})

-- Show indentation guides
require('packer').use({
  'https://github.com/lukas-reineke/indent-blankline.nvim',
  config = function() require("indent_blankline").setup {} end
})

