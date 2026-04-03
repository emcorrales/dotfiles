#! /bin/bash +xe

if [ $(uname) = "Linux" ]; then
  sudo apt update
  sudo apt install make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl git \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"

  curl -fsSL https://pyenv.run | bash

elif [ $(uname) = "Darwin" ]; then
  brew update
  brew install pyenv
else
  echo "OS not supported."
  exit 0
fi

pyenv install 3.14.3
pyenv global 3.14.3
exec $SHELL
python --version