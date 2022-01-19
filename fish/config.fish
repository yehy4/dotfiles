# Disable shell greeting.
set --global fish_greeting ''

# Use vi keybindings.
set --global fish_key_bindings fish_vi_key_bindings

# Load custom functions.
set --local configs_dir (dirname (status --current-filename))
set --global --prepend fish_function_path $configs_dir/functions

# Environment variables.
set --global --export EDITOR nvim

# Abbreviations.
abbr --global --add gitlog 'git log --all --graph --decorate --oneline'

# Attach to a (newly-created or existing) tmux session called "main"if not
# already inside a tmux session, and the terminal is not gnome-terminal (to
# accomodate "open in terminal" when right clicking in Nautilus/Gnome Files)
if not set --query TMUX
  and ps -o cmd= -p (ps -o ppid= -p $fish_pid | string trim) | grep -v -q gnome-terminal
    tmux new-session -A -s main
end
