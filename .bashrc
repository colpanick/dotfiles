#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Resize terminal if windows size changes
[[ $DISPLAY ]] && shopt -s checkwinsize

# Add users bin to path
export PATH="~/bin:$PATH"

# Default editor configs
export EDITOR="vim"
export VISUAL="vim"

# Aid for the stupid and lazy
shopt -s autocd			# Allow CD to directory without using cd
shopt -s cdable_vars	# Allow variable names with cd
shopt -s cdspell		# Correct typos for cd

# Set prompt.  Green if user, Red if root
if [ "$EUID" -ne 0 ]
	then export PS1='\[\033[0;33m\]{\[\033[0;32m\]\!\[\033[0;33m\]}-{\[\033[0;32m\]\t\[\033[0;33m\]}-{\[\033[0;32m\]\w\[\033[0;33m\]}\[\033[0;32m\]\n\[\033[0;33m\]{\[\033[1;32m\]\u\[\033[0;32m\]@\h\[\033[0;33m\]}\[\033[0;37m\]\$ '
	else export PS1='\[\033[0;33m\]{\[\033[0;31m\]\!\[\033[0;33m\]}-{\[\033[0;31m\]\t\[\033[0;33m\]}-{\[\033[0;31m\]\w\[\033[0;33m\]}\[\033[0;31m\]\n\[\033[0;33m\]{\[\033[1;31m\]\u\[\033[0;31m\]@\h\[\033[0;33m\]}\[\033[0;37m\]\$ '
fi

# If available, activate advanced bash completion
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
complete -A directory cd # Only show directories for cd completion

# Set command line behaviour to act like VI
set -o vi

# Colorize Man Output
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#   --== Custom Alias Declarations ==--

alias mkdir="mkdir -p" 	# Make parent folders if necessary
alias rm="rm -I" 		# Prompt if deleting more than 3 files
alias free="free -h"	# Human readable format

# We need more colors!
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias diff="diff --color=auto"

# Directory listing Shortcuts
command -v exa >> /dev/null && export LS="exa -gH --git" || LS="ls"
alias ls='$LS --color=auto --group-directories-first'
alias cls="clear ; ls"
alias ll="ls -lh"
alias la="ls -a"
alias lla="ls -la"

# Navigation Shortcuts
alias cd..="cd .."
alias cd..2="cd ../.."
alias cd..3="cd ../../.."
alias cd..4="cd ../../../.."
alias cd..5="cd ../../../../.."

# Misc
alias ports="ss -tulanp"
alias wget="wget -c"
command -v htop >> /dev/null && alias top="htop"
alias df="df -h"
alias du="du -ch"

command -v vim >> /dev/null && alias vi="vim"

alias sc="systemctl"

# Alias for managing dot files
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Distro specific overides
DISTRO="$(cat /etc/os-release | grep ^ID | cut -c 4-)"
[ -f ~/.config/distros/$DISTRO/bash_profile ] && . ~/.config/distros/$DISTRO/bash_profile

# Local machine overrides (Not meant to be tracked with git)
[ -f ~/.config/distros/bash_profile ] && . ~/.config/distros/bash_profile
