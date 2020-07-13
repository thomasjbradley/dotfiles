apps=(
  # OS tools
  istat-menus
  iterm2
  karabiner-elements
  keka
  little-snitch
  micro-snitch
  slate
  flux
  shortcat
  contexts
  carbon-copy-cloner
  bitwarden
  alfred
  bartender
  onyx

  # Apps
  appcleaner
  fsnotes
  soulver
  monodraw
  marked
  gitify
  dash
  malwarebytes
  handbrake

  # Browsers
  firefox-developer-edition
  microsoft-edge
  opera
  google-chrome

  # Dev tools
  gitup
  pgadmin4
  postgres
  imagealpha
  imageoptim
  visual-studio-code
  tableplus
  kaleidoscope
  cyberduck
  ngrok

  # QuickLook plugins
  betterzipql
  qlcolorcode
  qlmarkdown
  qlprettypatch
  qlstephen
  quicklook-csv
  quicklook-json
  suspicious-package
  webp-quicklook
)
echo "installing apps..."
brew cask install ${apps[@]}
