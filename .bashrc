[ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)"
[ -f ~/.aliases ] && source ~/.aliases

export PS1='\[\e[32m\]#>\[\e[m\] '
export DOTFILES_REPO=$HOME/.dotfiles
export DOTFILES_OLD=$HOME/.dotfiles.old

