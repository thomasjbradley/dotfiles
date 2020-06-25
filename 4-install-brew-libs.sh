libs=(
  git
  node
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
)
echo "installing libs..."
brew install ${libs[@]}
