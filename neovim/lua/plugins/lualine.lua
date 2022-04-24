require('packer').use({
  'https://github.com/nvim-lualine/lualine.nvim',
  requires = {'https://github.com/kyazdani42/nvim-web-devicons'},
  config = function()
    local b_section = enable_git_features and {'branch', 'diff'} or {}
    table.insert(b_section, {'diagnostics', sources = {'nvim_diagnostic'}})

    require('lualine').setup({
      options = {
        theme = 'onenord',
        section_separators = {left = '', right = ''},
        component_separators = '',
        -- Use one status line for all windows (equivalent to 'set laststatus=3')
        globalstatus = true
      },
      sections = {
        lualine_b = b_section,
        lualine_c = {
          {
            'filename',
            path = 1 -- Use relative filepath.
          }
        }
      },

      extensions = {'nvim-tree'}
    })
  end
})
