function vissh -d "SSH with vi keybindings"
  ssh -t $argv "bash -o vi"
end
