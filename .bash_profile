# Prompt
GREEN='\[\e[0;92m\]'
BLUE='\[\e[0;94m\]'
RED='\[\e[0;91m\]'
CLEAR='\[\e[m\]'
export PS1="$GREEN\u:${RED}λ> $CLEAR"

#Default Coloring for Terminal
export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad" 

# Sourcing all the cool things...
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

## Bash Completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

