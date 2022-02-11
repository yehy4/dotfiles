local keybindings = {}

-- Set <leader> key to space.
vim.g.mapleader = ' '

local function map_keys(mode, keys, command)
  vim.api.nvim_set_keymap(mode, keys, command, {noremap = true})
end

map_keys('n', '<leader>s', '<cmd>Telescope live_grep<cr>')
map_keys('n', '<leader>f', '<cmd>Telescope find_files<cr>')

map_keys('n', '<leader>gs', '<cmd>Telescope git_status<cr>')
map_keys('n', '<leader>gc', '<cmd>Telescope git_commits<cr>')
map_keys('n', '<leader>gbc', '<cmd>Telescope git_bcommits<cr>') -- Buffer commits.
map_keys('n', '<leader>gbs', '<cmd>Gitsigns stage_buffer<cr>')
map_keys('n', '<leader>gbr', '<cmd>Gitsigns reset_buffer<cr>')
map_keys('n', '<leader>ghs', '<cmd>Gitsigns stage_hunk<cr>')
map_keys('n', '<leader>ghu', '<cmd>Gitsigns undo_stage_hunk<cr>')
map_keys('n', '<leader>ghr', '<cmd>Gitsigns reset_hunk<cr>')
map_keys('n', '<leader>ghp', '<cmd>Gitsigns preview_hunk<cr>')
map_keys('n', '<leader>glb', '<cmd>Gitsigns blame_line<cr>')

map_keys('v', '<leader>y', '<cmd>OSCYank<cr>')

map_keys('n', '<leader>t', '<cmd>NvimTreeToggle<cr>')

-- Keybindings that are only available to the buffers attached to an LSP.
keybindings.activate_lsp_buffer_bindings = function(bufnr)
  local function buf_map_keys(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = {noremap = true, silent = true}
  buf_map_keys('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
  buf_map_keys('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  buf_map_keys('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  buf_map_keys('i', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  buf_map_keys('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  buf_map_keys('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  buf_map_keys('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  buf_map_keys('n', '<leader>lR', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  buf_map_keys('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  buf_map_keys('n', '<leader>ldc', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  buf_map_keys('n', '<leader>ldf', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  buf_map_keys('n', '<leader>lD', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
end

return keybindings
