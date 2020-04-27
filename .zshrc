if [ $(uname) = "Linux" ]; then
  [ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)"
elif [ $(uname) = "Darwin" ]; then
  export CLICOLOR=1
fi

[ -f ~/.aliases ] && source ~/.aliases

export HISTFILESIZE=20000
export HISTSIZE=20000

export DOTFILES_REPO=$HOME/.dotfiles
export DOTFILES_OLD=$HOME/.dotfiles.old

if [ -d ~/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi
