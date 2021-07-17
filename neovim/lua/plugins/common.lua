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
  config = function ()
    require('lualine').setup({
      options = { theme = 'material', icons_enabled = false }
    })
  end
})

-- Use Tree-sitter for smarter syntax highlighting and code folding
packer.use({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function ()
      -- Enable Tree-sitter-based code folding
      vim.o.foldmethod='expr'
      vim.o.foldexpr='nvim_treesitter#foldexpr()'

      -- Enable Tree-sitter-based syntax highlighting
      require'nvim-treesitter.configs'.setup({
       highlight = { enable = true },
      })
    end
})
