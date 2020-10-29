#!/bin/bash

# BASH completion script for Drush.
#
# Place this in your /etc/bash_completion.d/ directory or source it from your
# ~/.bash_completion or ~/.bash_profile files.  Alternatively, source
# examples/example.bashrc instead, as it will automatically find and source
# this file.

__drush_ps1() {
  f="${TMPDIR:-/tmp/}/drush-env/drush-drupal-site-$$"
  if [ -f $f ]
  then
    DRUPAL_SITE=$(cat "$f")
  fi

  [[ -n "$DRUPAL_SITE" ]] && printf "${1:- (%s)}" "$DRUPAL_SITE"
}

# Ensure drush is available.
[[ -x drush ]] || return

# Completion function, uses the "drush complete" command to retrieve
# completions for a specific command line COMP_WORDS.
_drush_completion() {
  # Set IFS to newline (locally), since we only use newline separators, and
  # need to retain spaces (or not) after completions.
  local IFS=$'\n'
  # The '< /dev/null' is a work around for a bug in php libedit stdin handling.
  # Note that libedit in place of libreadline in some distributions. See:
  # https://bugs.launchpad.net/ubuntu/+source/php5/+bug/322214
  COMPREPLY=( $(drush --early=includes/complete.inc "${COMP_WORDS[@]}" < /dev/null 2> /dev/null) )
}

# Register our completion function. We include common short aliases for Drush.
complete -o nospace -F _drush_completion d dr drush drush5 drush6 drush6 drush.php
