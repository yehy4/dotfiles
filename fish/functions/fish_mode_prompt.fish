function fish_mode_prompt
  set cyan 88C0D0
  set green A3BE8C
  set purple B48EAD
  set red BF616A
  set yellow EBCB8B
  switch $fish_bind_mode
    case default
      set_color --bold $yellow
      echo '[N] '
    case insert
      set_color --bold $cyan
      echo '[I] '
    case replace_one
      set_color --bold $purple
      echo '[R] '
    case visual
      set_color --bold $green
      echo '[V] '
    case '*'
      set_color --bold $red
      echo '[?]'
  end
  set_color normal
end
