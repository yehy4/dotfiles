-- Use Lualine for status line
require('packer').use( {
  'https://github.com/hoob3rt/lualine.nvim',
  config = function ()
    local filename_section_settings = {
      'filename',
      path = 1 -- Use relative filepath
    }

    local b_section = enable_git_features and {'branch', 'diff'} or {}
    table.insert(b_section, {'diagnostics', sources={'nvim_lsp'}})

    require('lualine').setup({
      options = {
        theme = 'material',
        section_separators = {left = '', right = ''},
        component_separators = ''
      },
      sections = {
        lualine_b =  b_section,
        lualine_c = { filename_section_settings }
      },
      inactive_sections = {
        lualine_c = { filename_section_settings }
      },
      extensions = {'nvim-tree'}
    })
  end
})
