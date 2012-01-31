# User specific environment and startup programs

export HISTSIZE=1000000;
PS1="[\u@\h/\A \W]\$";
#PS1="\033[1;37;40m[\u@\h/\j \W]\$\033[0m";
umask 022;

export PATH="`brew --prefix php`'/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH";

# If shell is non-interactive, don't process further.
[[ $- == *i* ]] || return;

# LS colors, follow a sequence of "fb" where forground color is followed by background. Default sequence is "exfxcxdxbxegedabagacad".
#   a     black
#   b     red
#   c     green
#   d     brown
#   e     blue
#   f     magenta
#   g     cyan
#   h     light grey
#   A     bold black, usually shows up as dark grey
#   B     bold red
#   C     bold green
#   D     bold brown, usually shows up as yellow
#   E     bold blue
#   F     bold magenta
#   G     bold cyan
#   H     bold light grey; looks like bright white
#   x     default foreground or background
# 
#   1.   directory
#   2.   symbolic link
#   3.   socket
#   4.   pipe
#   5.   executable
#   6.   block special
#   7.   character special
#   8.   executable with setuid bit set
#   9.   executable with setgid bit set
#   10.  directory writable to others, with sticky bit
#   11.  directory writable to others, without sticky bit
export LSCOLORS='gxfxcxdxbxegedabagacad';

# Turn on extended globbing and programmable completion
shopt -s extglob progcomp;

# Tab complete for sudo
complete -cf sudo

# Use delete key for erase.
# stty erase ^H

# Include rc file after defining variables.
# This step is skipped for non-interactive shells.
if [[ -r ~/.bashrc ]] && [[ $- == *i* ]]; then
    source ~/.bashrc
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
