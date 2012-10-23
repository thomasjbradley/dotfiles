#!/usr/bin/env bash

exclude=(".", "..", ".git", "bootstrap.sh", "README.md", "mamp.md", ".brew")
PWD=`pwd`

for f in `ls -a`
do
  case "${exclude[@]}" in  *"$f"*) continue ;; esac
  ln -fsn $PWD/$f ~/$f
done

# Set up some commonly used aliases
ln -s $HOME/Dropbox/ /db
ln -s $HOME/Dropbox/www /db/www
ln -s $HOME/Dropbox/twww /db/www/-tmp
ln -s $HOME/Dropbox/dwww /db/www/-dev
ln -s $HOME/Dropbox/vwww /db/www/-vwww
ln -s $HOME/Dropbox/tjb-dev /db/tjb-dev
ln -s /Applications/MAMP/htdocs /mamp
