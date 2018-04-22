[ -f ~/.env ] && source ~/.env

if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

PATH="$HOME/bin:$HOME/.local/bin:$PATH"
