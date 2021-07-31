function fish_prompt
  echo -n (set_color bryellow)$USER@(prompt_hostname)

  set --global fish_prompt_pwd_dir_length 0  # Disable path shortening
  echo -n (set_color brgreen) (prompt_pwd)

  if not set --query GIT_BASED_WORKFLOW ; or test $GIT_BASED_WORKFLOW != 0
    set_color brcyan
    set --global __fish_git_prompt_show_informative_status 1
    fish_git_prompt
  end

  set_color normal
  printf '\f\r--> '
end
