function fish_prompt
  echo -n (set_color magenta)\[(date "+%H:%M:%S")\]
  echo -n (set_color bryellow) $USER@(prompt_hostname)
  echo -n (set_color brgreen) $PWD

  set --global __fish_git_prompt_show_informative_status 1

  set_color brcyan
  fish_git_prompt

  set_color normal
  printf '\f\r|-> '
end
