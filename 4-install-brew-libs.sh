libs=(
  git
  node
  make
  rename
  tree
  direnv
  heroku
  dockutil
  youtube-dl
  ack
  bash-completion@2
  open-completion
  brew-cask-completion
  rsync
  hledger
)
echo "installing libs..."
brew install ${libs[@]}
