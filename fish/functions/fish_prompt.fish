function fish_prompt
  echo -n (set_color magenta)$USER@(prompt_hostname)(set_color normal)

  set --global fish_prompt_pwd_dir_length 0  # Disable path shortening
  echo -n (set_color yellow) (prompt_pwd)(set_color normal)

  if not set --query GIT_BASED_WORKFLOW ; or test $GIT_BASED_WORKFLOW != 0
    set --global __fish_git_prompt_show_informative_status 1
    set --global __fish_git_prompt_showcolorhints 1
    fish_git_prompt
  end

  printf '\f\r--> '
end
