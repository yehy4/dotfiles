# Use xterm with pretty colors
set -g default-terminal "xterm-256color"

# Set prefix to C-a
set -g prefix C-a
bind C-a send-prefix
unbind C-b

# Set history limit
set -g history-limit 10000

# Split panes with | and - and open new panes in the prior working directory
bind | split-window -h -c '#{pane_current_path}'
bind - split-window -v -c '#{pane_current_path}'
unbind '"'
unbind %

# Move between panes with hjkl
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Resize panes with HJKL
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# Use vi keybindings in copy mode
set -g mode-keys vi

# Make escape key responsive quickly (default is 500  milliseconds)
set -sg escape-time 10

# Select text in copy mode using v
bind-key -T copy-mode-vi v send -X begin-selection

# Copy text in copy mode using y
bind-key -T copy-mode-vi y send -X copy-selection

# Paste using p
unbind p
bind p paste-buffer

# Enable copy and paste to local system clipboard
set -g set-clipboard on

# Highlight the current active pane
set -g window-style bg=colour235
set -g window-active-style bg=black
