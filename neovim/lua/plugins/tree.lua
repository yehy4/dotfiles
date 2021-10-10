-- Use a better file explorer than the built-in netrw
require('packer').use({
  'https://github.com/kyazdani42/nvim-tree.lua',
  config = function ()
    -- Show indentation marks for open folders
    vim.g.nvim_tree_indent_markers = 1
    -- Enable creating more than 2 splits without asking where a new split
    -- should be created
    vim.g.nvim_tree_disable_window_picker = 1

    vim.g.nvim_tree_show_icons = {
      git = enable_git_features and 1 or 0,
      folders = 1,
      files = 1,
      folder_arrows = 0
    }

    require('nvim-tree').setup({
      -- Ensure that cursor does not cover icons
      hijack_cursor = true,
      -- Update the root directory of the tree when :cd is executed
      update_cwd = true,
      -- Show the current buffer in the tree
      update_focused_file = {enable = true},
      -- Resize the tree after opening a file. Useful when manually expanding
      -- the tree window to view deeply-nested directory structures.
      view = {auto_resize = true},
    })
  end
})
