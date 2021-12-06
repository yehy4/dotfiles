local keybindings = {}

-- Set <leader> key to space
vim.g.mapleader = ' '

local function map_keys(mode, keys, command)
  vim.api.nvim_set_keymap(mode, keys, command, {noremap = true})
end

-- Fuzzy search
map_keys('n', '<leader>s', ':Telescope live_grep<cr>')
-- Fuzzy search for files
map_keys('n', '<leader>f', ':Telescope find_files<cr>')

-- Git
map_keys('n', '<leader>gs', ':Telescope git_status<cr>')
map_keys('n', '<leader>gc', ':Telescope git_commits<cr>')
map_keys('n', '<leader>gbc', ':Telescope git_bcommits<cr>') -- Buffer commits
map_keys('n', '<leader>gbs', ':Gitsigns stage_buffer<cr>')
map_keys('n', '<leader>gbr', ':Gitsigns reset_buffer<cr>')
map_keys('n', '<leader>ghs', ':Gitsigns stage_hunk<cr>')
map_keys('n', '<leader>ghu', ':Gitsigns undo_stage_hunk<cr>')
map_keys('n', '<leader>ghr', ':Gitsigns reset_hunk<cr>')
map_keys('n', '<leader>glb', ':Gitsigns blame_line<cr>')

-- Yank using OSC52 when in visual mode
map_keys('v', '<leader>y', ':OSCYank<cr>')

-- Toggle directory tree
map_keys('n', '<leader>t', ':NvimTreeToggle<cr>')

-- Keybindings that are only available to the buffers attached to an LSP
keybindings.activate_lsp_buffer_bindings = function(bufnr)
  local function buf_map_keys(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = {noremap = true, silent = true}
  buf_map_keys('n', '<leader>lf', ':lua vim.lsp.buf.formatting()<CR>', opts)
  buf_map_keys('n', '<leader>lh', ':lua vim.lsp.buf.hover()<CR>', opts)
  buf_map_keys('n', '<leader>ls', ':lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_map_keys('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>', opts)
  buf_map_keys('n', '<leader>lt', ':lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_map_keys('n', '<leader>la', ':lua vim.lsp.buf.code_action()<CR>', opts)
  buf_map_keys('n', '<leader>lg', ':lua vim.lsp.buf.references()<CR>', opts)
  buf_map_keys('n', '<leader>li', ':lua vim.lsp.buf.implementation()<CR>', opts)
  buf_map_keys('n', '<leader>ldc', ':lua vim.lsp.buf.declaration()<CR>', opts)
  buf_map_keys('n', '<leader>ldf', ':lua vim.lsp.buf.definition()<CR>', opts)
  buf_map_keys('n', '<leader>lD', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
end

return keybindings
