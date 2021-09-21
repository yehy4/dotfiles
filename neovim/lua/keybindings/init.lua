local keybindings = {}

-- Set <leader> key to space
vim.g.mapleader = ' '

local function map_keys(mode, keys, command)
  vim.api.nvim_set_keymap(mode, keys, command, {noremap = true})
end

-- Use <leader>tf to fuzzy search
map_keys('n', '<leader>tg', ':Telescope live_grep theme=ivy<cr>')

-- Use <leader>tf to for fuzzy file name search
map_keys('n', '<leader>tf', ':Telescope find_files theme=ivy<cr>')

-- Use <leader>y to perform OSC52 yanking when in visual mode
map_keys('v', '<leader>y', ':OSCYank<cr>')

-- Use <leader>b to toggle directory browser tree
map_keys('n', '<leader>b', ':NvimTreeToggle<cr>')

-- Keybindings that are only available to the buffers attached to an LSP
keybindings.activate_lsp_buffer_bindings = function(bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<leader>lf', ':lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<leader>lh', ':lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>ls', ':lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>lt', ':lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>la', ':lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>lg', ':lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>li', ':lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>ldc', ':lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<leader>ldf', ':lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>lD', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

  -- Use <leader>lc for omni completion
  buf_set_keymap('i', '<leader>lc', '<C-x><C-o>', opts)
end

return keybindings
