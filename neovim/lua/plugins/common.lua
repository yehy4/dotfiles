local packer = require('packer')

-- Enable OSC 52 yanking
packer.use('https://github.com/ojroques/vim-oscyank')

-- Use GitHub theme
packer.use({
    'https://github.com/projekt0n/github-nvim-theme', 
    config = function() require('github-theme').setup() end
})

-- Use Lualine for status line
packer.use( {
  'https://github.com/hoob3rt/lualine.nvim',
  config = function () require('lualine').setup({options = {theme = 'material'}}) end
})

-- Use Tree-sitter for smarter syntax highlighting
packer.use({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function ()
      require'nvim-treesitter.configs'.setup({
       highlight = { enable = true },
      })
    end
})
