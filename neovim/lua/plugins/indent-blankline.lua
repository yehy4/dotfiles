require('packer').use({
  'https://github.com/lukas-reineke/indent-blankline.nvim',
  config = function() require("indent_blankline").setup {} end
})
