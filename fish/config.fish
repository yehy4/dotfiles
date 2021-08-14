# Disable shell greeting
set --global fish_greeting ''

# Use vi keybindings
set --global fish_key_bindings fish_vi_key_bindings

# Load custom functions
set --local configs_dir (dirname (status --current-filename))
set --global --prepend fish_function_path $configs_dir/functions

# Abbreviations
abbr --global --add gitlog 'git log --all --graph --decorate --oneline'

# Attach to a (newly-created or existing) tmux session called main
if not set --query TMUX  # only execute if not already inside a tmux session
  tmux new-session -A -s main
end
