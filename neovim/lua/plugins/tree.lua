-- Use a better file explorer than the built-in netrw
require('packer').use({
  'https://github.com/kyazdani42/nvim-tree.lua',
  opt = true, cmd = {'NvimTreeToggle', 'NvimTreeOpen'},
  setup = function ()
    -- Use <leader>t to toggle
    vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<cr>', {noremap = true})
    end,
  config = function ()
    -- Show indentation marks for open folders
    vim.g.nvim_tree_indent_markers = 1
    -- Enable creating more than 2 splits without asking where a new split
    -- should be created
    vim.g.nvim_tree_disable_window_picker = 1
    end
})
