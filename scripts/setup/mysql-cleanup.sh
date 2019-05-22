#!/bin/bash

if [ $(uname) = "Linux" ]; then
  sudo apt-get remove --purge mysql-server mysql-common
  sudo rm -rf /etc/mysql /var/lib/mysql
  sudo apt-get autoremove
  sudo apt-get autoclean
  sudo apt-get purge mysql*
elif [ $(uname) = "Darwin" ]; then
  brew remove mysql
  brew cleanup
  launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
  rm ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
  sudo rm -rf /usr/local/var/mysql
fi
