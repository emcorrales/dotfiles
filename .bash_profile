[ -f ~/.profile ] && source ~/.profile
[ -f ~/.bashrc ] && source ~/.bashrc

if [ $(uname) = "Darwin" ]; then
  [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
fi
