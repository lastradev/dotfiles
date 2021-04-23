#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# save dotfiles commands
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' 

alias ls='ls --color=auto'
alias vim="nvim"
alias v="nvim"
PS1='[\u@\h \W]\$ '

export PATH="$PATH:/home/oscargl/development/flutter/bin"
export PATH="$PATH:/home/oscargl/.local/bin"
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable" 

colorscript random

eval "$(starship init bash)"
