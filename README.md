# dotfiles

Configuration files for an efficient **terminal-based** and **keyboard-based**
development workflow.

## Overview

This workflow relies on the following tools:
* [neovim](https://github.com/neovim/neovim) for text-editing
* [ripgrep](https://github.com/BurntSushi/ripgrep) for quick searching
* [tmux](https://github.com/tmux/tmux) for terminal multiplexing
* [zsh](https://github.com/zsh-users/zsh) for a configurable shell

Because each development workflow is slightly different, these configuration
files are designed with extensibility in mind. For example, the configuration
files in this repository do not _replace_ the default configuration
files/directories for the tools above; rather, they augment them (see the
[installation](#installation) section below for more details).

## Prerequisites
1. [neovim](https://github.com/neovim/neovim) >=
   [**0.7**](https://github.com/neovim/neovim/releases/tag/v0.7.0)
1. [tmux](https://github.com/tmux/tmux)
1. [zsh](https://github.com/zsh-users/zsh)
1. [ripgrep](https://github.com/BurntSushi/ripgrep)
1. A terminal that supports
   [OSC 52](https://www.reddit.com/r/vim/comments/k1ydpn/a_guide_on_how_to_copy_text_from_anywhere/).
   This allows you to copy text into your local system's clipboard regardless
   of how many nested remote SSH sessions you might have.
   * Example: [kitty](https://github.com/kovidgoyal/kitty) (cross-platform) or
     [iTerm](https://github.com/gnachman/iTerm2) (macOS only).

## Installation

Clone this repository into a directory of your choosing. For example, to clone
into your home directory:

```shell
cd ~ && git clone <url_of_this_repository>
```

### neovim

Add the following to your `~/.config/nvim/init.lua` file:

```lua
local configs_path = '<absolute_path_where_you_cloned_this_repo>/dotfiles/neovim'
vim.o.runtimepath = configs_path .. ',' .. vim.o.runtimepath
require('init')

-- Uncomment the following line to enable the C/C++ workflow.
-- require('workflows/cpp')

-- Uncomment the following line to enable the Python workflow.
-- require('workflows/python')
```

After running neovim for the first time, make sure to run `:PackerSync` (to
download the required plugins) and restart neovim.

#### Workflows

To add support for specific workflows:

1. Uncomment the workflows line in your `~/.config/nvim/init.lua`
1. Follow the workflow-specific instructions below


##### C/C++

Ensure that [clangd](https://github.com/clangd/clangd) is installed.

##### Python

Ensure that [Python LSP
Server](https://github.com/python-lsp/python-lsp-server) is installed.

### tmux

Add the following to your `~/.tmux.conf` file:

```shell
source <absolute_path_where_you_cloned_this_repo>/dotfiles/tmux/tmux.conf
```

### zsh

Add the following to your `~/.zshrc` file:

```shell
export GIT_BASED_WORKFLOW 1
source <absolute_path_where_you_cloned_this_repo>/dotfiles/zsh/zshrc
```

Run the following to set zsh as your default shell (make sure to logout and log
back in - or restart - afterwards):

```shell
$ chsh -s $(`which zsh`) $USER
```

If your workflow does not involve using Git, change the value of
`GIT_BASED_WORKFLOW` above to `0` instead of `1`. This could improve the
performance of neovim.

### kitty

If you are using kitty as your terminal, add the following to your
`~/.config/kitty/kitty.conf` file:

```shell
include <absolute_path_where_you_cloned_this_repo>/dotfiles/kitty/kitty.conf
```

### JetBrains Mono Font and Nerd Font symbols

The [JetBrains Mono](https://www.jetbrains.com/lp/mono/) font has built-in
ligature support, and [Nerd Fonts](https://www.nerdfonts.com/) can be used to
display icons.

On Linux, run:

```shell
cd ~/.local/share/fonts
```

and on macOS, run:

```shell
cd ~/Library/Fonts
```

then run:

```shell
curl -Lo "Symbols-2048-em Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/src/glyphs/Symbols-2048-em%20Nerd%20Font%20Complete.ttf
curl -Lo "JetBrainsMono-2.242.zip" https://github.com/JetBrains/JetBrainsMono/releases/download/v2.242/JetBrainsMono-2.242.zip
unzip -q -d JetBrainsMono-2.242 JetBrainsMono-2.242.zip
rm JetBrainsMono-2.242.zip
```
