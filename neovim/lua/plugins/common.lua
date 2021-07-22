local packer = require('packer')

-- Enable OSC 52 yanking
packer.use('https://github.com/ojroques/vim-oscyank')

-- Use GitHub theme
packer.use({
    'https://github.com/projekt0n/github-nvim-theme',
    config = function() require('github-theme').setup() end
})

-- Use Lualine for status line
packer.use( {
  'https://github.com/hoob3rt/lualine.nvim',
  config = function ()
    require('lualine').setup({
      options = { theme = 'material', icons_enabled = false },
      sections = {
        -- Display relative filepath in status line
        lualine_c = {{'filename', path = 1}}
      },
      inactive_sections = {
        -- Display relative filepath in status line
        lualine_c = {{'filename', path = 1}}
      },
      extensions = {'nvim-tree'}
    })
  end
})

-- Use Tree-sitter for smarter syntax highlighting and code folding
packer.use({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function ()
      -- Enable Tree-sitter-based code folding
      vim.o.foldmethod='expr'
      vim.o.foldexpr='nvim_treesitter#foldexpr()'

      -- Enable Tree-sitter-based syntax highlighting
      require'nvim-treesitter.configs'.setup({
       highlight = { enable = true },
      })
    end
})

-- Use a better file explorer than the built-in netrw
packer.use({
  'https://github.com/kyazdani42/nvim-tree.lua',
  config = function ()
    -- Open tree when launching nvim without arugments or in a directory
    vim.g.nvim_tree_auto_open = 1
    -- Enable creating more than 2 splits without asking where a new split
    -- should be created
    vim.g.nvim_tree_disable_window_picker = 1
    -- Disable arrows next to folders
    vim.g.nvim_tree_show_icons = {
      git = 1,
      folders = 1,
      files = 1,
      folder_arrows = 0
    }
    -- Keybindings
    -- Use <leader>t to toggle
    vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<cr>', {noremap = true})
  end
})
