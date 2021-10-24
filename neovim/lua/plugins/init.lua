-- Bootstrap Packer if it does not exist
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Packer doesn\'t exist at: ' .. install_path .. '. Downloading...')
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command('packadd packer.nvim')
  print('Packer downloaded!')
end

local packer = require('packer')
packer.init()
packer.reset()

-- Allow Packer to manage itself
packer.use('https://github.com/wbthomason/packer.nvim')

enable_git_features = vim.env.GIT_BASED_WORKFLOW ~= '0'

require('plugins/yank')
require('plugins/icons')
require('plugins/statusline')
require('plugins/theme')
require('plugins/tree')
require('plugins/syntax')
require('plugins/lsp')
require('plugins/telescope')
if enable_git_features then require('plugins/git') end
