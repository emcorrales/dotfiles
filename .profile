[ -f ~/.env ] && source ~/.env
[ -f ~/.bashrc ] && source ~/.bashrc

if [ $(uname) = "Linux" ]; then
  PATH="$HOME/bin:$HOME/.local/bin:$PATH"
fi
