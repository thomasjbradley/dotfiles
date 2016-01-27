#!/usr/bin/env bash

exclude=(
  ".",
  "..",
  ".DS_Store",
  ".git",
  "install.sh",
  "README.md",
  "mamp.md",
  "keyremap-private.xml",
  "keyremap-user.xml",
  "vhost-setup.sh",
  ".brew"
)

PWD=`pwd`

for f in `ls -a`
do
  case "${exclude[@]}" in  *"$f"*) continue ;; esac
  ln -sfn $PWD/$f ~/$f
done

# Set up some commonly used aliases
ln -sfn ~/Desktop /ds
ln -sfn ~/Dropbox /db
ln -sfn ~/Dropbox/www /www
ln -sfn ~/Dropbox/tjb-dev /tjb-dev
ln -sfn /Applications/MAMP/htdocs /mamp

# Set up some special config files
cp ./keyremap-private.xml ~/Library/Application\ Support/KeyRemap4MacBook/private.xml

# Sequel Pro favourites & settings
ln -sfn /db/Preferences/Sequel\ Pro/com.sequelpro.SequelPro.plist com.sequelpro.SequelPro.plist
ln -sfn /db/Preferences/Sequel\ Pro/Application\ Support/ Sequel\ Pro

# Change login shell
# https://matt.sh/fix-os-x-terminal-launch-speed
chsh -s /usr/local/bin/bash
