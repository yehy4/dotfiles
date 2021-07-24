# Disable shell greeting
set --global fish_greeting ''

# Use vi keybindings
set --global fish_key_bindings fish_vi_key_bindings

set --local configs_dir (dirname (status --current-filename))

# Set a custom prompt
source $configs_dir/functions/fish_prompt.fish
