#!/usr/bin/env bash

exclude=(".", "..", ".git", "bootstrap.sh", "README.md", "mamp.md", ".brew")
PWD=`pwd`

for f in `ls -a`
do
  case "${exclude[@]}" in  *"$f"*) continue ;; esac
  ln -sfn $PWD/$f ~/$f
done

# Set up some commonly used aliases
ln -sfn ~/Dropbox /db
ln -sfn ~/Dropbox/www /www
ln -sfn ~/Dropbox/www/-tmp /twww
ln -sfn ~/Dropbox/www/-dev /dwww
ln -sfn ~/Dropbox/www/-vhosts /vwww
ln -sfn ~/Dropbox/tjb-dev /tjb-dev
ln -sfn /Applications/MAMP/htdocs /mamp
