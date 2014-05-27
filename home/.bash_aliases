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
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Shortcuts
alias c=clear
alias h='history'
alias h10='history 10'
alias j='jobs -l'
alias less='less -R'
alias m=less
alias psg='/bin/ps auxww | grep'
alias purge='/bin/rm -f \#*\# *~ .*~ *% .*% core'

# git
alias av='git branch -av'
alias suno='git status -s -uno'
alias rv='git remote -v'
alias staged='git diff --staged'
