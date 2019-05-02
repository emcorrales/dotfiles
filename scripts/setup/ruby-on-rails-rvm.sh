#!/bin/bash -e
if [ $(uname) = "Linux" ]; then
  sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev \
    libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev nodejs \
    libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

elif [ $(uname) = "Darwin" ]; then

  # Install sqlite 3.
  brew install sqlite3

  # Install MySQL.
  brew install mysql
  brew services start mysql

  # Install PostgreSQL.
  brew install postgresql
  brew services start postgresql
fi

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable --ignore-dotfiles --rails
source ~/.rvm/scripts/rvm

ruby -v
rails -v
