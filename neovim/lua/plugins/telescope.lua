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
        layout_strategy = 'vertical',
        layout_config = {
          -- Move prompt on top of results.
          prompt_position = 'top',
          -- Move the preview window to the bototm.
          mirror = true
        },
        -- Display results from the top to bottom.
        sorting_strategy = 'ascending',
        -- Use 'BRAILLE PATTERN BLANK' (U+2800) unicode character instead of blank space to prevent
        -- the blank space from being highlighted as a trailing space.
        prompt_prefix = '>⠀'
      }
    })
  end
})

