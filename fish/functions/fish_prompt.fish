function __is_prompt_too_long
  set prompt $argv[1]
  set prompt_length (string length $prompt)
  return (test $prompt_length -gt $COLUMNS)
end

function fish_prompt
  set user_section $USER@(prompt_hostname)
  set --global fish_prompt_pwd_dir_length 0  # Disable path shortening
  set pwd_full_section (prompt_pwd)

  if not set --query GIT_BASED_WORKFLOW ; or test $GIT_BASED_WORKFLOW != 0
    set --global __fish_git_prompt_show_informative_status 1
    set --erase __fish_git_prompt_showcolorhints
    set git_uncolored_section (fish_git_prompt)
    set --global __fish_git_prompt_showcolorhints 1
    set git_colored_section (fish_git_prompt)
  end

  set should_shorten_path 1
  set pwd_section $pwd_full_section
  while test $should_shorten_path -ne 0
    if __is_prompt_too_long (echo '[I]' $user_section $pwd_section $git_uncolored_section)
      set pwd_full_section (string replace --regex '^\/?~?[^\/]+\/' '' $pwd_full_section)
      set pwd_section /.../$pwd_full_section
    else
      set should_shorten_path 0
    end
  end

  echo -n (set_color --bold D08F70)$user_section(set_color normal)
  echo -n (set_color 88C0D0) $pwd_section(set_color normal)
  echo -n $git_colored_section

  printf '\f\r--> '
end
