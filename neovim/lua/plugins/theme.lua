-- Use GitHub theme
require('packer').use({
    'https://github.com/projekt0n/github-nvim-theme',
    config = function() require('github-theme').setup() end
})
