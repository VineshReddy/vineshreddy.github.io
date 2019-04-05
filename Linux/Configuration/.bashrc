# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias pacs='sudo pacman -S '
alias pacr='sudo pacman -Rs '
alias bx='bash ~/.bind.sh bluetooth'

alias fm='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
#alias vim='vim --servername localhost --remote-tab-silent '
alias pdf='foxitreader'
alias off='libreoffice'
alias dl='bash ~/.bind.sh aria'
#alt key (arg: N) remove nd -r '\e-'
#for i in "-" {0..9}; do bind -r "\e$i"; done


export PATH=$PATH:~/Applications/.npm/bin/
export PATH=$PATH:~/Applications/bin/


#Default editor vim
export VISUAL=vim
export EDITOR="$VISUAL"


##preserve bash history : tmux
## avoid duplicates..
#export HISTCONTROL=ignoredups:erasedups

## append history entries..
#shopt -s histappend

## After each command, save and reload history
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#startx after login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi


