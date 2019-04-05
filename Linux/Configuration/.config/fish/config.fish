#disable greeting message
set -U fish_greeting

#enable vi bindings 
fish_vi_key_bindings


set -x HOSTNAME () 

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end


alias bx='bash ~/.bind.sh bluetooth'
alias dl='bash ~/.bind.sh aria'



set PATH $PATH ~/Applications/.npm/bin/
set PATH $PATH ~/Applications/bin/
export PATH


#Default editor vim
set -U EDITOR vim
