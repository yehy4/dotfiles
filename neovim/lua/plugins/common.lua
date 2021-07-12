local packer = require('packer')

-- Enable OSC52 yanking
packer.use('https://github.com/ojroques/vim-oscyank')

-- Use GitHub theme
packer.use({
    'https://github.com/projekt0n/github-nvim-theme', 
    config = function() require('github-theme').setup() end
})

