-- Enable OSC52 yanking
require('packer').use({
  'https://github.com/ojroques/vim-oscyank',
  config = function ()
    -- Use <leader>y to perform OSC52 yanking when in visual mode
    vim.api.nvim_set_keymap('v', '<leader>y', ':OSCYank<cr>', {noremap = true})
  end
})
