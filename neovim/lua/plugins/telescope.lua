require('packer').use({
  'https://github.com/nvim-telescope/telescope.nvim',
  requires = {
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/kyazdani42/nvim-web-devicons'
  },
  config = function()
    require('telescope').setup({
      defaults = {
        -- Move prompt on top of results.
        layout_config = {prompt_position = 'top'},
        -- Display results from the top to bottom.
        sorting_strategy = 'ascending'
      }
    })
  end
})

