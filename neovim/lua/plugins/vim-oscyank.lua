require('packer').use({
  'https://github.com/ojroques/vim-oscyank',
  -- This is required after tmux 3.3. See https://github.com/ojroques/vim-oscyank/issues/26.
  config = function() vim.g.oscyank_term = 'default' end
})
