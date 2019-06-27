#! /bin/bash -xe

if [ $(uname) = "Linux" ]; then

  if [ ! $(java -version) ]; then
    echo "No JRE installed."
    exit 1
  fi

  if [ $(lsb_release -is) = "Ubuntu" ]; then
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt update
    sudo apt install jenkins
    sudo systemctl start jenkins
    sudo systemctl status jenkins
  else
    echo "Unsupported linux distro."
    exit 1
  fi

elif
  exit 1
fi
