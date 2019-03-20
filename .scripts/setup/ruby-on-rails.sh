#!/bin/bash
if [ $(uname) = "Linux" ]; then
  sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev \
    libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev nodejs \
    libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
  export PATH="$HOME/.rbenv/shims:$PATH"
elif [ $(uname) = "Darwin" ]; then
  brew install rbenv ruby-build
fi

eval "$(rbenv init -)"

# Verify that rbenv is properly installed.
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

rbenv install 2.4.2
rbenv global 2.4.2
ruby -v

gem install bundler
gem install rails
rbenv rehash
rails -v
