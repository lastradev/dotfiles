#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# save dotfiles commands
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' 

alias ls='ls --color=auto'
alias vim="nvim"
PS1='[\u@\h \W]\$ '

export PATH="$PATH:/home/oscargl/development/flutter/bin"
export PATH="$PATH:/home/oscargl/.local/bin"
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable" 

neofetch

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
