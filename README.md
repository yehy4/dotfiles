# dotfiles

Configuration files for common tools.

## Neovim

### Installation

Add the following to your `init.lua` file (typically at `~/.config/nvim/init.lua`)

```lua
local configs_path = '<path_to_where_you_cloned_this_repo>/neovim'
vim.o.runtimepath = configs_path .. ',' .. vim.o.runtimepath
vim.o.runtimepath = configs_path .. '/after,' .. vim.o.runtimepath
require('init')
```
