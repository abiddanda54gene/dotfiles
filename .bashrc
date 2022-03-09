# Adding aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Adding functions
if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

# Vim is the default editor
export EDITOR='vim'
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

