require('packer').use({
  'https://github.com/rmehri01/onenord.nvim',
  config = function() vim.cmd('colorscheme onenord') end
})
