#! /bin/bash +xe

if [ $(uname) = "Linux" ]; then
  curl -fsSL https://pyenv.run | bash
elif [ $(uname) = "Darwin" ]; then
  brew update
  brew install pyenv
else
  echo "OS not supported."
  exit 0
fi
exec $SHELL
pyenv install 3.14.3
