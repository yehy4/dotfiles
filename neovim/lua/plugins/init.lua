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

-- Use custom colorscheme with Tree-sitter support.
require('plugins/onenord')

-- Show indentation guides.
require('plugins/indent-blankline')

-- Use custom status line.
require('plugins/lualine')

-- Use custom file explorer.
require('plugins/nvim-tree')

-- Use Tree-sitter for smarter syntax highlighting and code folding.
require('plugins/nvim-treesitter')

-- Use Telescope for fuzzy searching.
require('plugins/telescope')

-- Enable OSC 52 yanking.
require('plugins/vim-oscyank')

-- Enable easy configuration of language servers.
require('plugins/nvim-lspconfig')

-- Enable auto completion.
require('plugins/nvim-cmp')

if enable_git_features then
  -- Show Git signs in window gutter.
  require('plugins/gitsigns')
end

local lsp = {}

-- The on_attach function should be called when a buffer attaches to the language server.
lsp.lsp_on_attach = function(client, bufnr)
  require('keybindings').activate_lsp_buffer_bindings(bufnr)

  -- Attempt to highlight the symbol under the cursor in the document.
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_command('autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()')
    vim.api.nvim_command('autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
  end

end

lsp.lsp_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol
                                                                   .make_client_capabilities())

return lsp
