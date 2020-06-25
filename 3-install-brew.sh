#!/bin/bash

brew update
brew upgrade

brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
brew install findutils
brew install bash
brew install https://raw.githubusercontent.com/Homebrew/homebrew-versions/master/bash-completion2.rb
brew install wget --enable-iri
brew tap heroku/brew
brew tap homebrew/cask-versions

# Change login shell
chsh -s /usr/local/bin/bash
