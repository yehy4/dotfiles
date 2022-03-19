require('packer').use({
  'https://github.com/kyazdani42/nvim-tree.lua',
  requires = {'https://github.com/kyazdani42/nvim-web-devicons'},
  config = function()
    -- Show indentation marks for open folders.
    vim.g.nvim_tree_indent_markers = 1

    -- Show the current working directory name without path at the top of the
    -- tree.
    vim.g.nvim_tree_root_folder_modifier = ':t'

    -- Refresh tree when focus is regained. This is useful, for example,
    -- if files are modified outside of Neovim.
    vim.cmd('autocmd FocusGained * :NvimTreeRefresh')

    require('nvim-tree').setup({
      -- Ensure that cursor does not cover icons.
      hijack_cursor = true,
      -- Update the root directory of the tree when :cd is executed.
      update_cwd = true,
      git = {enable = enable_git_features, ignore = false},
      actions = {
        -- Change directory for all open windows when directory is changed in tree.
        change_dir = {global = true},
        open_file = {
          -- Resize the tree after opening a file. Useful when manually expanding
          -- the tree window to view deeply-nested directory structures.
          resize_window = true,
          -- Enable creating more than 2 splits without asking where a new split
          -- should be created.
          window_picker = {enable = false}
        }
      }
    })
  end
})
