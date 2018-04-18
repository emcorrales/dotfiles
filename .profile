[ -f ~/.env ] && source ~/.env

if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

if [ $(uname) = "Linux" ]; then
  PATH="$HOME/bin:$HOME/.local/bin:$PATH"
fi
