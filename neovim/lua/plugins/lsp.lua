-- Enable easy usage of LSPs
require('packer').use({'https://github.com/neovim/nvim-lspconfig'})

local lsp = {}

-- The on_attach function should be called when a buffer attaches to the LSP.
lsp.on_attach = function(client, bufnr)
  -- Enable manual completion using omnifunction
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Activate LSP keybindings for the buffer
  require('keybindings').activate_lsp_buffer_bindings(bufnr)
end

return lsp
