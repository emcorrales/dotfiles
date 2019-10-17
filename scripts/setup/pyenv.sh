#! /bin/bash +xe

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
exec "$SHELL"
if [ $(uname) = "Linux" ]; then
  if [ $(lsb_release -is) = "Ubuntu" ]; then
    sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
  elif [ $(lsb_release -is) = "CentOS" ]; then
    yum install gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel
  else
    echo "Unsupported linux distro."
    exit 1
  fi

elif [ $(uname) = "Darwin" ]; then
  brew install openssl readline sqlite3 xz zlib
  sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
else
  echo "OS not supported."
  exit 0
fi
pyenv install 2.7.8
