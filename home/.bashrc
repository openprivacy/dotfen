# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# Set PATH so it includes user's private bin *first* if it exists.
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# Set PATH so it includes composers global bin directory.
[ -d "$HOME/.composer/vendor/bin" ] && PATH="$PATH:$HOME/.composer/vendor/bin"

# Set PATH so it includes cabal global bin directory.
[ -d "$HOME/.cabal/bin" ] && PATH="$PATH:$HOME/.cabal/bin"

# Set PATH so it includes user's ruby bin directory.
[ -d "$HOME/.gem/ruby/2.3.0/bin" ] && PATH="$PATH:$HOME/.gem/ruby/2.3.0/bin"

# Set PATH so it includes go global bin directory.
if [ -d "$HOME/go/bin" ] ; then
    export GOPATH="$HOME/go"
    PATH="$PATH:$HOME/go/bin"
fi

# Set PATH so it includes CUDA bin directory and add to LD_LIBRARY_PATH.
if [ -d "/usr/local/cuda-7.5/bin" ] ; then
    PATH="$PATH:/usr/local/cuda-7.5/bin"
    if [ -d "/usr/local/cuda-7.5/lib64" ]; then
	export LD_LIBRARY_PATH=/usr/local/cuda-7.5/lib64:$LD_LIBRARY_PATH
    fi
fi

export PATH
export EDITOR=vi

# Set SSH to use gpg-agent (https://wiki.archlinux.org/index.php/GnuPG#gpg-agent)
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
fi
# Set GPG TTY
export GPG_TTY=$(tty)
# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

# Enable git command line completion.
[ -f /usr/share/git/completion/git-completion.bash ] && \
    source /usr/share/git/completion/git-completion.bash

# Enable AWS command line completion.
[ -f /usr/bin/aws_completer ] && complete -C aws_completer aws

# Load AWS CLI keys
[ -f $HOME/.aws_keys ] && source $HOME/.aws_keys

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe.sh ] && export LESSOPEN="|lesspipe.sh %s"

# Xmonad fix for LibreOffice dialog issues when not using gwd
export SAL_USE_VCLPLUGIN="gen lowriter"

# Alias definitions.
[ -f $HOME/.bash_aliases ] && source $HOME/.bash_aliases

# A sensible bash environment from https://github.com/mrzool/bash-sensible
if [ -f "$HOME/.homesick/repos/bash-sensible/sensible.bash" ]; then
    source $HOME/.homesick/repos/bash-sensible/sensible.bash
else
    # Don't put duplicate lines or lines starting with space in the history.
    export HISTCONTROL=ignoreboth
    export HISTIGNORE='history*'

    # Append to the history file, don't overwrite it.
    shopt -s histappend

    # For setting history length see HISTSIZE and HISTFILESIZE in bash(1).
    HISTSIZE=50000
    HISTFILESIZE=20000

    # Check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # Quick change dir to within this list.
    shopt -s autocd
    shopt -s cdspell
fi

# For this to work, first create a symlink, for example:
# ln -s ~/.homesick/repos/dotfen/bash_inc ~/.bash_inc
for incl in $HOME/.bash_inc/*.bash $HOME/.bash_inc/*.sh
  do . $incl
done

# Set up a basic color prompt if no local prompt setting available
if [ ! -f $HOME/.bash_inc/prompt.bash ]; then
# Set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
    fi

    # Set a fancy prompt (non-color, unless we know we "want" color).
    case "$TERM" in
	xterm-color) color_prompt=yes;;
    esac

    if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	    # We have color support; assume it's compliant with Ecma-48
	    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	    # a case would tend to support setf rather than setaf.)
	    color_prompt=yes
	else
	    color_prompt=
	fi
    fi

    if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
    unset color_prompt force_color_prompt

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
	xterm*|rxvt*)
	    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	    ;;
	*)
	    ;;
    esac
fi
