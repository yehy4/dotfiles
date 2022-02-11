require('packer').use({
  'https://github.com/nvim-lualine/lualine.nvim',
  requires = {'https://github.com/kyazdani42/nvim-web-devicons'},
  config = function()
    local filename_section_settings = {
      'filename',
      path = 1 -- Use relative filepath.
    }

    local b_section = enable_git_features and {'branch', 'diff'} or {}
    table.insert(b_section, {'diagnostics', sources = {'nvim_diagnostic'}})

    require('lualine').setup({
      options = {
        theme = 'onenord',
        section_separators = {left = '', right = ''},
        component_separators = ''
      },
      sections = {lualine_b = b_section, lualine_c = {filename_section_settings}},
      inactive_sections = {lualine_c = {filename_section_settings}},
      extensions = {'nvim-tree'}
    })
  end
})
