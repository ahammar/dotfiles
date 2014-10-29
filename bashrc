#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l'

# sane default editor
export EDITOR=vim

# fancy prompt
PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local LAST_EXIT="$?"
    PS1=""

    local RED='\[\e[31m\]'
    local GREEN='\[\e[01;32m\]'
    local BLUE='\[\e[01;34m\]'
    local PURPLE='\[\e[01;35m\]'
    local NORMAL='\[\e[0m\]'

    # Set title of terminal window
    case "$TERM" in
    xterm*|rxvt*)
        PS1+="\[\e]0;\w\a\]"
        ;;
    *)
        ;;
    esac

    # Show exit status of last command if unsuccessful
    if [ $LAST_EXIT != 0 ]; then
        PS1+="${RED}✗ ${LAST_EXIT}\n"
    fi

    # Show host and working directory
    PS1+="${GREEN}\h${NORMAL}:${BLUE}\w"

    # Show current git branch if applicable
    local CURRENT_BRANCH="$(git branch 2> /dev/null | sed -n 's/* //p')"

    if [ "$CURRENT_BRANCH" ]; then
        PS1+=" ${PURPLE}[${CURRENT_BRANCH}]"
    fi

    # Finally show dollar prompt on a separate line
    PS1+="${NORMAL}\n\$ "
}
