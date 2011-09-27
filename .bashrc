# .bashrc

# User specific aliases and functions

# ruby/rails stuff
alias ss='./script/server'
alias sc='./script/console'

alias ls='/bin/ls -Gp';
alias ll='/bin/ls -alGp';
alias l='/bin/ls -lFGp';
alias sls='sudo /bin/ls --color=auto';
alias sll='sudo /bin/ls -al --color=auto';
alias psa='ps faxo pid,user,nice,%cpu,%mem,etime,cputime,args';
alias psg='ps wfaxo pid,user,nice,%cpu,%mem,etime,cputime,args | egrep -i';
#alias hg='history | egrep -i';
alias cx='chmod 755'; 
alias cz='chmod 644'; 
alias cu='chmod 600'; 
alias cr='chown root:root'; 
alias tmail='sudo tail -n 50 -f /var/log/maillog'; 
alias tlog='sudo tail -n 50 -f /var/log/messages'; 
alias tsecure='sudo tail -n 50 -f /var/log/secure';
alias tweba='sudo tail -n 50 -f /var/log/httpd/access_log';
alias twebe='sudo tail -n 50 -f /var/log/httpd/error_log';
alias dua='du -sk {.[a-z],}* | sort -rn';
alias svi='/usr/bin/sudo vim';
alias sudo='sudo -H';
alias sss='/usr/bin/sudo su -';

# daves stuff
alias tunh="ssh -fND localhost:1337 stilldavid.dyndns.org";
alias gcb='grep -r "$1" ~/Code/live/codebase/ | grep -v "svn"';
alias tsite='tail -f ~/Code/live/log/site_log';
alias cds='cd ~/Code/sparkfun/';
alias cdl='cd /usr/local/';
alias bell='echo -n ';

function gl()
{
  if [[ -z $1 ]]; then
    echo "Usage: gl SEARCHTERM";
  else
    ack -a "$1" | less
  fi
}

# git stuff
alias gd='git diff --color'
alias gs='git status'

# Move files to the trash.
function trash ()
{
    mkdir -p ~/.Trash
    mv -vi $* ~/.Trash/;
}

#
# INCLUDES
#

# Local rc.
[[ -f ~/.bashrc-local ]] && . ~/.bashrc-local;

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}")"
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"

PS1="[\u@\h:\w]\$(parse_git_branch)\$ "

