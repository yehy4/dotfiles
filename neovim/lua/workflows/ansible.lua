require('lspconfig').ansiblels.setup({
  on_attach = require('plugins').lsp_on_attach,
  capabilities = require('plugins').lsp_capabilities,
  -- By default, filetypes only includes 'yaml.ansible'. This requries manually changing the
  -- filetype with 'set filetype=yaml.ansible'.
  -- See https://github.com/neovim/nvim-lspconfig/pull/1708
  filetypes = {'yaml', 'yaml.ansible'}
})
