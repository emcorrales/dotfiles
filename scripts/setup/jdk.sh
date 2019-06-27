#!/bin/bash
if [ $(uname) = "Linux" ]; then
  if [ $(lsb_release -is) = "Ubuntu" ]; then
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update

    sudo apt-get install oracle-java8-installer
    sudo apt-get install oracle-java8-set-default
  else
    echo "Unsupported linux distro."
    exit 1
  fi

elif [ $(uname) = "Darwin" ]; then
  brew tap caskroom/versions
  brew cask install java8
  export JAVA_HOME=$(/usr/libexec/java_home)
else
  echo "OS not supported."
  exit 0
fi

java -version
javac -version
javaws -eersion

echo "You may need to logout or restart to be able to apply changes to the JAVA_HOME."
