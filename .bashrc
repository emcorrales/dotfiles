[ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)"
[ -f ~/.aliases ] && source ~/.aliases

export PS1='\[\e[32m\]#(\j)>\[\e[m\] '
export DOTFILES_REPO=$HOME/.dotfiles
export DOTFILES_OLD=$HOME/.dotfiles.old

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
