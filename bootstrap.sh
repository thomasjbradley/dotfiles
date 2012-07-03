#!/usr/bin/env bash

exclude=(".", "..", ".git", "bootstrap.sh", "README.md")
PWD=`pwd`

for f in `ls -a`
do
  case "${exclude[@]}" in  *"$f"*) continue ;; esac
  ln -fs $PWD/$f ~/$f
done
