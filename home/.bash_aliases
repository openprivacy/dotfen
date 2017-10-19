# -*- shell-script -*-

# homeshick & dotfen support
alias homeshick="$HOME/.homesick/repos/homeshick/home/.homeshick"

# misc
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias dr='drush'

# safety
alias cp='cp -i'
alias mv='mv -i'
alias yes='echo "yes! yes! yes!"'

# dir listing and changing
alias ls='ls --color=auto'
alias ll='ls -alF'
alias l='ls -Alh'
alias t='l -rt'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias dl='cd ~/Downloads'
alias w='cd ~/workspace'

# list the 10 most recently changed files/directories
function ltr(){ /bin/ls --color=auto -ltr "$@" | tail; }
function ltra(){ /bin/ls --color=auto -ltrA "$@" | tail; }

# List only directories
alias lsd='ls -l ${colorflag} | grep "^d"'

# Directory stack aliases.
alias pd=pushd
alias po=popd
alias d='dirs -v'
alias 1='pd +1'
alias 2='pd +2'
alias 3='pd +3'
alias 4='pd +4'
alias 5='pd +5'
alias 6='pd +6'
alias 7='pd +7'
alias 8='pd +8'
alias 9='pd +9'

# My IP address
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# Enable aliases to be sudo-ed
alias sudo='sudo '

# View HTTP traffic
alias sniff="sudo ngrep -d 'wlan0' -t '^(GET|POST) ' 'tcp and port 80'"

# Solr server access - then http://localhost:8983/solr/#/
alias solr_connect='ssh gn2-solr -f -L 8983:localhost:8983 -N'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Shortcuts
alias c=clear
alias fig=docker-compose
alias h='history'
alias h10='history 10'
alias j='jobs -l'
alias less='less -R'
alias m=less
alias psg='/bin/ps auxww | grep'
alias purge='/bin/rm -f \#*\# *~ .*~ *% .*% core'

# git
alias av='git branch -avv'
alias bv='git branch -vv'
alias rv='git remote -v'
alias suno='git status -s -uno'
alias staged='git diff --staged'

# Docker
alias docker-clean='docker rmi -f $(docker images -q -a -f dangling=true)'
alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}"'

# Inspec https://github.com/chef/inspec `docker pull chef/inspec`
alias inspec='docker run -it --rm -v $(pwd):/share chef/inspec'

# OpenControl compliance-masonry `docker pull opencontrolorg/compliance-masonry`
alias compliance-masonry='docker run -it --rm -v $(pwd):/opencontrol opencontrolorg/compliance-masonry'

# LastPass
alias lclip='lpass show --password --clip'
