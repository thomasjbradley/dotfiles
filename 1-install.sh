#!/usr/bin/env bash

exclude=(
  ".",
  "..",
  ".DS_Store",
  ".git",
  "install.sh",
  "README.md",
)

PWD=`pwd`

for f in `ls -a`
do
  case "${exclude[@]}" in  *"$f"*) continue ;; esac
  ln -sfn $PWD/$f ~/$f
done

# Set up some commonly used aliases
sudo ln -sfn ~/Desktop /ds
sudo ln -sfn ~/Dropbox /db
sudo ln -sfn ~/Dropbox/www /www
sudo ln -sfn ~/Dropbox/tjb-dev /tjb-dev

# For MacOS Catalina
echo -e 'ds\tUsers/thomasjbradley/Desktop' | sudo tee -a /etc/synthetic.conf
echo -e 'db\tUsers/thomasjbradley/Dropbox' | sudo tee -a /etc/synthetic.conf
echo -e 'www\tUsers/thomasjbradley/Dropbox/www' | sudo tee -a /etc/synthetic.conf
echo -e 'tjb-dev\tUsers/thomasjbradley/Dropbox/tjb-dev' | sudo tee -a /etc/synthetic.conf

# Set up some special config files
ln -sfn ~/dotfiles/.karabiner.json /Users/thomasjbradley/.config/karabiner/karabiner.json
