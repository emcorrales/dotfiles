#!/bin/bash
if [ $(uname) = "Linux" ]; then
  sudo add-apt-repository ppa:webupd8team/java
  sudo apt-get update

  sudo apt-get install oracle-java8-installer
  sudo apt-get install oracle-java8-set-default

  java -version
  javac -version
  javaws -eersion
elif [ $(uname) = "Darwin" ]; then
  brew tap caskroom/versions
  brew cask install java8
else
  echo "OS not supported."
  exit 0
fi

echo "You may need to logout or restart to be able to apply changes to the JAVA_HOME."
