# .bashrc

case "$HOSTNAME" in
  'karl')
    PR_HOST_COLOR=$PR_GREEN;
    CODE_DIR='~/Code/sparkfun/';
    ;;

  'dave-dev')
    PR_HOST_COLOR=$PR_GREEN;
    CODE_DIR='/var/www/';
    ;;
  'spino')
    PR_HOST_COLOR=$PR_RED;
    CODE_DIR='/var/www/';
    ;;
  'seismo')
    PR_HOST_COLOR=$PR_RED;
    CODE_DIR='/var/www/';
    ;;
  'tyranno')
    PR_HOST_COLOR=$PR_RED;
    ;;
  *)
    PR_HOST_COLOR=$PR_BLUE;
    ;;
esac

# User specific aliases and functions

# ruby/rails stuff
alias ss='./script/server'
alias sc='./script/console'

alias ack='ack-grep'
alias ai='ack-grep -i'

alias ls='/bin/ls -Gp';
alias ll='/bin/ls -alGp';
alias l='/bin/ls -lFGp';
alias cx='chmod 755';
alias cz='chmod 644';
alias cu='chmod 600';
alias cr='chown root:root';
alias svi='/usr/bin/sudo vim';
alias sudo='sudo -H';
alias sss='/usr/bin/sudo su -';

# daves stuff
alias tunh="ssh -fND localhost:1337 stilldavid.dyndns.org";
alias gcb='grep -r "$1" ~/Code/live/codebase/ | grep -v "svn"';
alias tsite='tail -f ~/Code/live/log/site_log';
alias cds='cd $CODE_DIR';
alias cdl='cd /usr/local/';
alias bell='echo -n ';

# git stuff
alias gd='git diff --color'
alias gs='git status'
alias g='git'

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

