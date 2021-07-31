-- Use Lualine for status line
require('packer').use( {
  'https://github.com/hoob3rt/lualine.nvim',
  config = function ()
    local filename_section_settings = {
      'filename',
      path = 1 -- Use relative filepath
    }

    require('lualine').setup({
      options = {
        theme = 'material',
        section_separators = {'', ''},
        component_separators = ''
      },
      sections = {
        lualine_b = enable_git_features and {'branch'} or {},
        lualine_c = { filename_section_settings }
      },
      inactive_sections = {
        lualine_c = { filename_section_settings }
      },
      extensions = {'nvim-tree'}
    })
  end
})
