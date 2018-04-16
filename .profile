[ -f ~/.env ] && source ~/.env

if [ $(uname) = "Linux" ]; then
  PATH="$HOME/bin:$HOME/.local/bin:$PATH"
fi
