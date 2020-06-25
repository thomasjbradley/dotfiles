# Installation

```
cd ~
git clone git@github.com:thomasjbradley/dotfiles.git
cd ~/dotfiles
./1-install.sh
./2-install-macos-prefs.sh
./3-install-brew.sh
./4-install-brew-libs.sh
./5-install-brew-cask.sh
./6-install-macos-dock.sh
./7-install-npm-globals.sh
```

## Linking the Dropbox Desktop

**Must be completed with the root user!**

https://support.apple.com/en-us/HT204012

```
sudo mv /Users/thomasjbradley/Desktop /Users/thomasjbradley/Desktop.bak
sudo ln -sfn /Users/thomasjbradley/Dropbox/Desktop /Users/thomasjbradley/Desktop
sudo rm -Rf /Users/thomasjbradley/Desktop.bak
```

**Get Info, set symlink "Locked"**

## Storing SSH keys in the keychain

```
ssh-add -K /path/to/public/key
```

## Fixing Backspace on Mac

http://fredericiana.com/2006/10/16/fixing-backspace-and-delete-for-ssh-in-os-xs-terminalapp/

## Fixing desktop backgrounds that don’t stay:

Delete: ~/Library/Application Support/Dock/desktoppicture.db

## Thanks

Shamelessly ripped off from:

- https://github.com/mathiasbynens/dotfiles
- https://github.com/addyosmani/dotfiles
