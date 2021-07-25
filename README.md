# dotfiles

Configuration files for an efficient **terminal-based** and **keyboard-based**
development workflow.

## Overview

This workflow relies on the following tools:
* [neovim](https://github.com/neovim/neovim) for text-editing
* [tmux](https://github.com/tmux/tmux) for terminal multiplexing
* [fish shell](https://github.com/fish-shell/fish-shell) for a modern shell
  with low configuration overhead.

Because each development workflow is slightly different, these configuration
files are designed with extensibility in mind. For example, the configuration
files in this repository do not *replace* the default configuration
files/directories for the tools above; rather, they augment them (see the
[installation](#installation) section below for more details).

## Prerequisites
1. [neovim](https://github.com/neovim/neovim) >=
   [**0.5**](https://github.com/neovim/neovim/releases/tag/v0.5.0)
1. [tmux](https://github.com/tmux/tmux)
1. [fish shell](https://github.com/fish-shell/fish-shell) (recommended >=
   [**3.0**](https://github.com/fish-shell/fish-shell/releases/tag/3.0.0))
1. A terminal that supports
   [OSC52](https://www.reddit.com/r/vim/comments/k1ydpn/a_guide_on_how_to_copy_text_from_anywhere/).
   This allows you to copy text into your local system's clipboard regardless
   of how many nested remote SSH sessions you might have.
   * Example: [kitty](https://github.com/kovidgoyal/kitty) (cross-platform) or
     [iTerm](https://github.com/gnachman/iTerm2) (macOS only).
1. A terminal that uses a font patched by [Nerd
Fonts](https://github.com/ryanoasis/nerd-fonts). This allows you to have pretty
icons in neovim.
    * Example: A [patched
      version](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures)
      of [JetBrains Mono](https://www.jetbrains.com/lp/mono/) font with
      [ligatures](https://en.wikipedia.org/wiki/Ligature_(writing)) support.

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
vim.o.runtimepath = configs_path .. '/after,' .. vim.o.runtimepath
require('init')
```

After running neovim for the first time, make sure to run `:PackerSync` (to
download the required plugins) and restart neovim.

### tmux

Add the following to your `~/.tmux.conf` file:

```shell
source <absolute_path_where_you_cloned_this_repo>/dotfiles/tmux/tmux.conf
```

### fish shell

Add the following to your `~/.config/fish/config.fish` file:

```fish
source <absolute_path_where_you_cloned_this_repo>/dotfiles/fish/config.fish
```

### kitty

If you are using kitty as your terminal, add the following to your
`~/.config/kitty/kitty.conf` file:

```shell
include <absolute_path_where_you_cloned_this_repo>/dotfiles/kitty/kitty.conf
```

### Pached JetBrains Mono font

To download and install the [Nerd Fonts-patched
version](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures)
of JetBrains Mono with ligatures support:

On Linux, run `cd ~/.local/share/fonts`.

On macOS, run `cd ~/Library/Fonts`.

Now download the font by running:

```shell
curl -Lo "JetBrains Mono Bold Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Bold/complete/JetBrains%20Mono%20Bold%20Nerd%20Font%20Complete.ttf
curl -Lo "JetBrains Mono Bold Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/BoldItalic/complete/JetBrains%20Mono%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
curl -Lo "JetBrains Mono ExtraBold Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/Ligatures/ExtraBold/complete/JetBrains%20Mono%20ExtraBold%20Nerd%20Font%20Complete.ttf
curl -Lo "JetBrains Mono ExtraBold Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/ExtraBoldItalic/complete/JetBrains%20Mono%20ExtraBold%20Italic%20Nerd%20Font%20Complete.ttf
curl -Lo "JetBrains Mono ExtraLight Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/ExtraLight/complete/JetBrains%20Mono%20ExtraLight%20Nerd%20Font%20Complete.ttf
curl -Lo "JetBrains Mono ExtraLight Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/ExtraLightItalic/complete/JetBrains%20Mono%20ExtraLight%20Italic%20Nerd%20Font%20Complete.ttf
curl -Lo "JetBrains Mono Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Italic/complete/JetBrains%20Mono%20Italic%20Nerd%20Font%20Complete.ttf
curl -Lo "JetBrains Mono Light Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Light/complete/JetBrains%20Mono%20Light%20Nerd%20Font%20Complete.ttf
curl -Lo "JetBrains Mono Light Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/LightItalic/complete/JetBrains%20Mono%20Light%20Italic%20Nerd%20Font%20Complete.ttf
curl -Lo "JetBrains Mono Medium Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Medium/complete/JetBrains%20Mono%20Medium%20Nerd%20Font%20Complete.ttf
curl -Lo "JetBrains Mono Medium Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/MediumItalic/complete/JetBrains%20Mono%20Medium%20Italic%20Nerd%20Font%20Complete.ttf
curl -Lo "JetBrains Mono Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete.ttf
curl -Lo "JetBrains Mono Thin Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Thin/complete/JetBrains%20Mono%20Thin%20Nerd%20Font%20Complete.ttf
curl -Lo "JetBrains Mono Thin Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/ThinItalic/complete/JetBrains%20Mono%20Thin%20Italic%20Nerd%20Font%20Complete.ttf
```

If you are using [kitty](#kitty), add the following to
`~/.config/fontconfig/fonts.conf`:

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
<match target="scan">
    <test name="family">
        <string>JetBrainsMono Nerd Font</string>
    </test>
    <edit name="spacing">
        <int>100</int>
    </edit>
</match>
</fontconfig>
```

Finally, run `fc-cache -r` to update your font information caches.
