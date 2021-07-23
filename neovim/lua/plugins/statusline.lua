-- Use Lualine for status line
require('packer').use( {
  'https://github.com/hoob3rt/lualine.nvim',
  config = function ()
    require('lualine').setup({
      options = { theme = 'material' },
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


