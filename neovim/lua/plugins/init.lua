-- Install Packer if it is not installed.
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Packer doesn\'t exist at: ' .. install_path .. '. Downloading...')
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command('packadd packer.nvim')
  print('Packer downloaded!')
end

local packer = require('packer')
enable_git_features = vim.env.GIT_BASED_WORKFLOW ~= '0'

packer.init()
packer.reset()

-- Allow Packer to manage itself.
packer.use('https://github.com/wbthomason/packer.nvim')

-- Enable using pretty icons.
packer.use({'https://github.com/kyazdani42/nvim-web-devicons'})

-- Enable OSC 52 yanking.
packer.use({'https://github.com/ojroques/vim-oscyank'})

-- Show indentation guides.
packer.use({
  'https://github.com/lukas-reineke/indent-blankline.nvim',
  config = function() require("indent_blankline").setup {} end
})

-- Use Tree-sitter for smarter syntax highlighting and code folding.
packer.use({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    -- Enable Tree-sitter-based code folding.
    vim.o.foldmethod = 'expr'
    vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

    -- Enable Tree-sitter-based syntax highlighting.
    require('nvim-treesitter.configs').setup({highlight = {enable = true}})
  end
})

-- Use custom colorscheme with Tree-sitter support.
packer.use({
  'https://github.com/glepnir/zephyr-nvim',
  config = function() vim.cmd('colorscheme zephyr') end
})

-- Use custom file explorer.
packer.use({
  'https://github.com/kyazdani42/nvim-tree.lua',
  commit = 'b853e1083c67a79b4eb046a112a8e12b35e9cd19',
  config = function()
    -- Show indentation marks for open folders.
    vim.g.nvim_tree_indent_markers = 1
    -- Enable creating more than 2 splits without asking where a new split
    -- should be created.
    vim.g.nvim_tree_disable_window_picker = 1

    vim.g.nvim_tree_show_icons = {
      git = enable_git_features and 1 or 0,
      folders = 1,
      files = 1,
      folder_arrows = 0
    }

    -- Refresh tree when focus is regained. This is useful, for example,
    -- if files are modified outside of Neovim.
    vim.cmd('autocmd FocusGained * :NvimTreeRefresh')

    require('nvim-tree').setup({
      -- Ensure that cursor does not cover icons.
      hijack_cursor = true,
      -- Update the root directory of the tree when :cd is executed.
      update_cwd = true,
      -- Show the current buffer in the tree.
      update_focused_file = {enable = true},
      -- Resize the tree after opening a file. Useful when manually expanding
      -- the tree window to view deeply-nested directory structures.
      view = {auto_resize = true},
      git = {enable = enable_git_features}
    })
  end
})

-- Use custom status line.
packer.use({
  'https://github.com/nvim-lualine/lualine.nvim',
  config = function()
    local filename_section_settings = {
      'filename',
      path = 1 -- Use relative filepath.
    }

    local b_section = enable_git_features and {'branch', 'diff'} or {}
    table.insert(b_section, {'diagnostics', sources = {'nvim_diagnostic'}})

    require('lualine').setup({
      options = {
        theme = 'material',
        section_separators = {left = '', right = ''},
        component_separators = ''
      },
      sections = {lualine_b = b_section, lualine_c = {filename_section_settings}},
      inactive_sections = {lualine_c = {filename_section_settings}},
      extensions = {'nvim-tree'}
    })
  end
})

-- Use Telescope for fuzzy searching.
packer.use({
  'https://github.com/nvim-telescope/telescope.nvim',
  requires = {'https://github.com/nvim-lua/plenary.nvim'},
  config = function()
    require('telescope').setup({
      defaults = {
        layout_config = {
          -- Move prompt on top of results.
          prompt_position = 'top'
        },
        -- Display results from the top to bottom.
        sorting_strategy = 'ascending'
      }
    })
  end
})

if enable_git_features then
  packer.use({
    'https://github.com/lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('gitsigns').setup() end
  })
end

require('plugins/lsp')
