#!/usr/bin/env bash

function prompt() {
  local git_branch="$(git_short_sha)$(scm_prompt_info)"
  if [[ $git_branch ]]
  then
    git_prompt=" $git_branch "
  else
    git_prompt=" "
  fi

  local prompt_char='» '
#  [[ $(grep `pwd` ~/.drush/*aliases.drushrc.php) ]] && prompt_char='∞ '

  if [ "$UID" = "0" ]; then
    local user_color=$red
  else
    local user_color=$green
  fi

  if [ "$SSH_CLIENT" != "" ]; then
    local user_ssh="${red}SSH$reset_color "
  else
    local user_ssh=''
  fi
    

  PS1="\n$(scm_char) ${user_ssh}[$user_color\u$reset_color@$green\H$reset_color] $yellow\w${reset_color}$git_prompt\n$red$prompt_char$reset_color"
  PS2='> '
  PS4='+ '
}


PROMPT_COMMAND=prompt

SCM_THEME_PROMPT_DIRTY=" $red✗${reset_color}"
SCM_THEME_PROMPT_CLEAN=" $green✓${reset_color}"
SCM_THEME_PROMPT_PREFIX='|'
SCM_THEME_PROMPT_SUFFIX=''

