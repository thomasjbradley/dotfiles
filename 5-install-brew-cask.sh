apps=(
  # OS tools
  istat-menus
  iterm2
  karabiner-elements
  keka
  little-snitch
  micro-snitch
  hammerspoon
  flux
  shortcat
  contexts
  carbon-copy-cloner
  bitwarden
  alfred
  bartender
  onyx
  iina
  keyboardcleantool
  netspot
  soundsource

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
  clementine
  kid3
  gimp
  inkscape
  libreoffice
  scribus
  shrinkit
  obs
  obsidian
  transmission

  # Browsers
  firefox-developer-edition
  microsoft-edge
  opera
  google-chrome
  brave-browser

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
  sim-daltonism
  marta
  insomnia

  # Plugins
  mailtrackerblocker

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
brew install ${apps[@]}
