[ -f ~/.env ] && source ~/.env
[ -f ~/.aliases ] && source ~/.aliases
[ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)"

[ -f ~/.prompt ] && source ~/.prompt

export HISTFILESIZE=20000
export HISTSIZE=20000

export DOTFILES_REPO=$HOME/.dotfiles
export DOTFILES_OLD=$HOME/.dotfiles.old

if [ -d ~/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

if [ -d ~/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - bash)"
fi