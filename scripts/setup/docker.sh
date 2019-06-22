#!/bin/sh

if [ $(uname) = "Darwin" ]; then
  brew cask install docker

  # Docker completion.
  etc=/Applications/Docker.app/Contents/Resources/etc
  ln -s $etc/docker.bash-completion $(brew --prefix)/etc/bash_completion.d/docker
  ln -s $etc/docker-machine.bash-completion $(brew --prefix)/etc/bash_completion.d/docker-machine
  ln -s $etc/docker-compose.bash-completion $(brew --prefix)/etc/bash_completion.d/docker-compose
elif [ $(uname) = "Linux" ]; then
  if [ $(lsb_release -is) = "Ubuntu" ]; then
    # SETUP REPOSITORY for Ubuntu.
    sudo apt-get update
    sudo apt-get install  apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) stable"

    # INSTALL DOCKER
    sudo apt-get update
    sudo apt-get install docker-ce

    # Test docker installation.
    sudo docker run hello-world

    # Enable running docker without sudo.
    sudo adduser $USER docker
    echo "Please logout then login again to use docker without sudo."
  fi
fi
