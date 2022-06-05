local keybindings = {}

-- Set <leader> key to space.
vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>s', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>')

vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<cr>')
vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<cr>')
vim.keymap.set('n', '<leader>gbc', '<cmd>Telescope git_bcommits<cr>') -- Buffer commits.
vim.keymap.set('n', '<leader>gbs', '<cmd>Gitsigns stage_buffer<cr>')
vim.keymap.set('n', '<leader>gbr', '<cmd>Gitsigns reset_buffer<cr>')
vim.keymap.set('n', '<leader>ghn', '<cmd>Gitsigns next_hunk<cr>')
vim.keymap.set('n', '<leader>ghs', '<cmd>Gitsigns stage_hunk<cr>')
vim.keymap.set('n', '<leader>ghu', '<cmd>Gitsigns undo_stage_hunk<cr>')
vim.keymap.set('n', '<leader>ghr', '<cmd>Gitsigns reset_hunk<cr>')
vim.keymap.set('n', '<leader>ghp', '<cmd>Gitsigns preview_hunk<cr>')
vim.keymap.set('n', '<leader>glb', '<cmd>Gitsigns blame_line<cr>')

vim.keymap.set('v', '<leader>y', ':OSCYank<cr>')

vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFile<cr>')

vim.keymap.set('n', '<leader>ps', '<cmd>PackerSync<cr>')
vim.keymap.set('n', '<leader>pc', '<cmd>PackerCompile<cr>')

-- Keybindings that are only available to the buffers attached to an LSP.
keybindings.activate_lsp_buffer_bindings = function(bufnr)
  local opts = {buffer = bufnr}
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, opts)
  vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>lR', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>lD', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<leader>ll', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', '<leader>lq', vim.diagnostic.setqflist, opts)
  vim.keymap.set('n', '<leader>ldc', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', '<leader>ldf', vim.lsp.buf.definition, opts)
  vim.keymap.set({'n', 'i'}, '<leader>ls', vim.lsp.buf.signature_help, opts)
end

return keybindings
