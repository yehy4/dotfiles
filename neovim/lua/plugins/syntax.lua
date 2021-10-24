-- Use Tree-sitter for smarter syntax highlighting and code folding
require('packer').use({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    -- Enable Tree-sitter-based code folding
    vim.o.foldmethod = 'expr'
    vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

    -- Enable Tree-sitter-based syntax highlighting
    require'nvim-treesitter.configs'.setup({highlight = {enable = true}})
  end
})
