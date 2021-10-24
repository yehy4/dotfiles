require('packer').use {
  'https://github.com/nvim-telescope/telescope.nvim',
  requires = {'https://github.com/nvim-lua/plenary.nvim'},
  config = function()
    require('telescope').setup({
      defaults = {
        layout_config = {
          -- Move prompt to on top of results
          prompt_position = 'top'
        },
        -- Display results from the top to bottom
        sorting_strategy = 'ascending'
      }
    })
  end
}
