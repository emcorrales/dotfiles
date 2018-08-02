#!/bin/bash
if [ $(uname) = "Linux" ]; then
  wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
  apt-get update
  esl-erlang
  apt-get install esl-erlang elixir

  # Install inotify-tools
  apt-get install inotify-tools
elif [ $(uname) = "Darwin" ]; then
  brew install elixir
  mix local.hex
else
  echo "Operating system not supported."
  exit 0
fi

elixir -v

mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
mix phoenix.new -v
