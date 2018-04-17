#!/bin/bash
DOTFILES_REPO=$HOME/.dotfiles
DOTFILES_OLD=$HOME/.dotfiles.old/`date +"%m-%d-%y-%T"`

[ -f $DOTFILES_REPO ] && rm -rf $DOTFILES_REPO
git clone --bare https://github.com/EmmanuelCorrales/dotfiles.git $DOTFILES_REPO

dotfiles() {
  git --git-dir=$DOTFILES_REPO --work-tree=$HOME $@
}

mkdir -p $DOTFILES_OLD
dotfiles checkout

if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
else
  echo "Backing up pre-existing dot files.";
  dotfiles checkout 2>&1 | grep -P "\t+" | awk {'print $1'} | xargs -I {} mv $HOME/{} $DOTFILES_OLD/
fi;

dotfiles checkout
dotfiles config status.showUntrackedFiles no

# Download and install essentials.
if [ $(uname) = "Darwin" ]; then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew install tig tree tmux
  brew cask install iterm2
elif [ $(uname) = "Linux" ]; then
  sudo apt-get update
  sudo apt-get install build-essential
  sudo apt-get install curl tig tmux tree xclip
else
  echo "Terminal not supported."
  exit 0
fi

# Vundle setup
if [ -d ~/.vim ]; then
  echo "Backing up old .vim directory."
  mv ~/.vim $DOTFILES_OLD
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Downloading and installing Vim plugins with Vundle..."
echo | echo | vim +PluginInstall +qall &>/dev/null
