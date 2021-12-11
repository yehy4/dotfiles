# dotfiles

Configuration files for an efficient **terminal-based** and **keyboard-based**
development workflow.

## Overview

This workflow relies on the following tools:
* [neovim](https://github.com/neovim/neovim) for text-editing
* [ripgrep](https://github.com/BurntSushi/ripgrep) for quick searching
* [tmux](https://github.com/tmux/tmux) for terminal multiplexing
* [fish shell](https://github.com/fish-shell/fish-shell) for a modern shell
  with low configuration overhead.

Because each development workflow is slightly different, these configuration
files are designed with extensibility in mind. For example, the configuration
files in this repository do not _replace_ the default configuration
files/directories for the tools above; rather, they augment them (see the
[installation](#installation) section below for more details).

## Prerequisites
1. [neovim](https://github.com/neovim/neovim) >=
   [**0.5**](https://github.com/neovim/neovim/releases/tag/v0.5.0)
1. [tmux](https://github.com/tmux/tmux)
1. [fish shell](https://github.com/fish-shell/fish-shell) (recommended >=
   [**3.0**](https://github.com/fish-shell/fish-shell/releases/tag/3.0.0))
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

-- Uncomment the following line to enable the Python workflow
-- require('workflows/python')
```

After running neovim for the first time, make sure to run `:PackerSync` (to
download the required plugins) and restart neovim.

#### Workflows

To add support for specific workflows:

1. Uncomment the workflows line in your `~/.config/nvim/init.lua`
1. Follow the workflow-specific instructions below

##### Python

Ensure that [Python LSP
Server](https://github.com/python-lsp/python-lsp-server) is installed.

### tmux

Add the following to your `~/.tmux.conf` file:

```shell
source <absolute_path_where_you_cloned_this_repo>/dotfiles/tmux/tmux.conf
```

### fish shell

Add the following to your `~/.config/fish/config.fish` file:

```fish
set --global --export GIT_BASED_WORKFLOW 1
source <absolute_path_where_you_cloned_this_repo>/dotfiles/fish/config.fish
```
<details>
  <summary>Setting fish as your default interactive shell</summary>

  Add the following to the end of your `~/.bashrc`:

  ```shell
  # If running an interactive shell and if fish shell is installed, start
  # fish. If the shell that called bash is already a fish shell, then do not
  # drop into a fish shell. This allows the user to drop into a bash shell from
  # within a fish shell.
  FISH_PATH="$(which fish)"
  if [[ "$-" =~ i && -x "${FISH_PATH}" && "${SHELL}" != "${FISH_PATH}" ]]; then
    exec env SHELL="${FISH_PATH}" "${FISH_PATH}" -i
  fi
  ```
</details>

If your workflow does not involve using Git, change the value of
`GIT_BASED_WORKFLOW` above to `0` instead of `1`. This could improve the
performance of neovim and fish.

### kitty

If you are using kitty as your terminal, add the following to your
`~/.config/kitty/kitty.conf` file:

```shell
include <absolute_path_where_you_cloned_this_repo>/dotfiles/kitty/kitty.conf
```

### JetBrains Mono Font

[Download](https://github.com/JetBrains/JetBrainsMono/releases/latest) the
JetBrains Mono font with ligatures support. To install, unzip the file into
`~/.local/share/fonts` on Linux or `~/Library/Fonts` on macOS.
