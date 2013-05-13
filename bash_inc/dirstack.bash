
# Adapted from http://aijazansari.com/2010/02/20/navigating-the-directory-stack-in-bash/


# An enhanced 'cd' - push directories
# onto a stack as you navigate to it.
#
# The current directory is at the top
# of the stack.
#
function stack_cd {
    if [[ $1 ]]; then
        # use the pushd bash command to push the directory
        # to the top of the stack, and enter that directory
        pushd "$1" > /dev/null
    else
        # the normal cd behavior is to enter $HOME if no
        # arguments are specified
        pushd $HOME > /dev/null
    fi
}
# the cd command is now an alias to the stack_cd function
#
alias cd=stack_cd


# Swap the top two directories on the stack
#
function swap {
    pushd > /dev/null
}
# s is an alias to the swap function
alias s=swap


# Pop the top (current) directory off the stack
# and move to the next directory
#
function pop_stack {
    popd > /dev/null
}
alias p=pop_stack


# Other handy aliases.
alias d='dirs -v'
alias 1='cd +1'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'


