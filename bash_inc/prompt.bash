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
    local user_color=$bold_red
  else
    local user_color=$bold_green
  fi

  if [ "$SSH_CLIENT" != "" ]; then
    local user_ssh="${bold_red}SSH$reset_color "
  else
    local user_ssh=''
  fi

  PS1="\n$(scm_char) ${user_ssh}[$user_color\u$reset_color@$bold_green\H$reset_color] $yellow\w${reset_color}$git_prompt\n$bold_red$prompt_char$reset_color"
  PS2='> '
  PS4='+ '
}


PROMPT_COMMAND=prompt

SCM_THEME_PROMPT_DIRTY=" $red✗${reset_color}"
SCM_THEME_PROMPT_CLEAN=" $green✓${reset_color}"
SCM_THEME_PROMPT_PREFIX='|'
SCM_THEME_PROMPT_SUFFIX=''

