local install_path = vim.fn.stdpath('data')..'/site/pack/plugins/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Packer doesn\'t exist at: ' .. install_path .. '. Downloading...')
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command('packadd packer.nvim')
  print('Packer downloaded!')
end
