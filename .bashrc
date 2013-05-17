# .bashrc

        RED="\[\033[1;31m\]"
     YELLOW="\[\033[1;33m\]"
      GREEN="\[\033[1;32m\]"
       BLUE="\[\033[1;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[1;37m\]"
 COLOR_NONE="\[\e[0m\]"

case "$HOSTNAME" in
  'karl')
    PR_HOST_COLOR=$WHITE;
    CODE_DIR='~/Code/sparkfun/';
    ;;

  'dave-dev')
    PR_HOST_COLOR=$WHITE;
    CODE_DIR='/var/www/';
    ;;
  'spiff.local')
    PR_HOST_COLOR=$WHITE;
    CODE_DIR='~/Code/sparkfun/';
    ;;
  'spino')
    PR_HOST_COLOR=$RED;
    CODE_DIR='/var/www/';
    ;;
  'seismo')
    PR_HOST_COLOR=$RED;
    CODE_DIR='/var/www/';
    ;;
  'tyranno')
    PR_HOST_COLOR=$RED;
    ;;
  *)
    PR_HOST_COLOR=$BLUE;
    ;;
esac

# User specific aliases and functions

# ruby/rails stuff
alias r='rails'

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
alias sg='cd $CODE_DIR; ./burn sparkgen --no-syntax-check; cd -'
alias dev='ssh -A dave-dev'

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

  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
    state="${RED}⚡"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="${YELLOW}↑"
    else
      remote="${YELLOW}↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="${YELLOW}↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo " (${branch})${remote}${state}"
  fi
}

function prompt_func() {
    previous_return_value=$?;
    git_status="$(git status 2> /dev/null)"
    #prompt="${TITLEBAR}${BLUE}[${YELLOW}\W${GREEN}$(parse_git_branch)${BLUE}]${COLOR_NONE} "
    prompt="${TITLEBAR}${BLUE}[${PR_HOST_COLOR}\h${BLUE}]${BLUE}[${YELLOW}\W${GREEN}$(parse_git_branch)${BLUE}]${COLOR_NONE} "

    if test $previous_return_value -eq 0
    then
        PS1="${prompt}➔ "
    else
        PS1="${prompt}${RED}➔${COLOR_NONE} "
    fi

    if [ "$git_status" == "" ]; then
        PS1="${BLUE}[${PR_HOST_COLOR}\u@\h${BLUE}] ${YELLOW}\W ${BLUE}\$ ${COLOR_NONE}"
    fi
}

PROMPT_COMMAND=prompt_func


# PS1="[\u@\h:\w]\$(parse_git_branch)\$ "

export GEM_HOME='/usr/local'
