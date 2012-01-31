stilldavid's Kit
================

This is my home directory, including dotfiles and such. This is mostly for me to clone onto the boxes I work on a lot, but maybe you'll get something out of it.

Cloning into Home
================

In case I forget this, which I  always do, here's how to clone into ~ without mv'ing a bunch of stuff:

    cd
    git init
    git remote add origin git@github.com:stilldavid/home.git
    git fetch
    git branch master origin/master
    git checkout master

git probably won't overwrite files, so make sure the dir is clean first.

cheers!
