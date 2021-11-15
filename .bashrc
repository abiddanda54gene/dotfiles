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

# Altering the path to include what we need
PATH=$PATH:/usr/local/texlive:/usr/local/opt:/usr/local/sbin:/usr/local/include
PATH=$PATH:/usr/local/
export PATH=$PATH:/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.1/bin:$HOME/.gem/ruby/3.0.0/bin

export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=60

# Setting up pyenv stuff
export PYENV_VIRTUALENV_DISABLE_PROMPT=0
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Bash completion from Snakemake
#`snakemake --bash-completion`
