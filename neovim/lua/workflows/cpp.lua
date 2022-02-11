require('lspconfig').clangd.setup({
  on_attach = require('plugins').lsp_on_attach,
  capabilities = require('plugins').lsp_capabilities
})
