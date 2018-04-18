[ -f ~/.env ] && source ~/.env

if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
  export PATH="$RBENV_ROOT/bin:$PATH"
  export PATH="$RBENV_ROOT/plugins/ruby-build/bin:$PATH"
fi

if [ $(uname) = "Linux" ]; then
  PATH="$HOME/bin:$HOME/.local/bin:$PATH"
fi
