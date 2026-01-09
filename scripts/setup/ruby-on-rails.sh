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

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"

eval "$(rbenv init -)"

# Verify that rbenv is properly installed.
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

rbenv install 3.4.8
rbenv global 3.4.8
rbenv rehash
ruby -v

gem install bundler
gem install rails
rbenv rehash
rails -v
