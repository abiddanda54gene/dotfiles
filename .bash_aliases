#---------------------------------------------#
# --- Aliases by Arjun Biddanda ------------- #
#---------------------------------------------#

# - General Aliases - #
alias R='R --quiet'
alias r='R'
#alias haskell='ghci -H32m'
#alias ocaml='utop'
#alias python='python3'
#alias pip='pip3'

# - Command-Line Aliases -#
alias ls='ls -GH'
alias l='ls -GH'
alias la='ls -a'
alias lsa='ls -lah'
alias top='htop'
alias shuf='gshuf'
alias grepln='builtin grep -nr'
alias dirsize='du -ch | grep total'
alias spellchk='aspell -c'
alias webserv='jekyll serve'
alias preview='qlmanage -p "$@" &> /dev/null'
#alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias bc='bc -l'
alias c='clear'


# - System Aliases - #
alias chkbat='system_profiler SPPowerDataType | grep "Cycle Count"'
alias drain='yes > /dev/null & yes > /dev/null & yes > /dev/null & yes > /dev/null'
alias speedtest='speedtest-cli'

alias zlncnt=zlncntfn
alias zpeek=zpeekfn
alias zcat='unpigz -c'
alias untar='tar -xvf'
