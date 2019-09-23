#!/bin/bash
if [ $(uname) = "Darwin" ]; then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install tmux wget coreutils grep gnu-sed
elif [ $(uname) = "Linux" ]; then
  sudo apt-get install build-essential curl tmux xclip
else
  echo "Terminal not supported."
  exit 0
fi

echo "Setting up dotfiles..."
DOTFILES_REPO=$HOME/.dotfiles
DOTFILES_OLD=$HOME/.dotfiles.old/`date +"%m-%d-%y-%T"`
dotfiles() {
  git --git-dir=$DOTFILES_REPO --work-tree=$HOME $@
}

echo "Cleaning up previous dotfiles..."
if [ -d $DOTFILES_REPO ]; then
  cd $HOME
  dotfiles ls-tree -r master --name-only | xargs -n1 rm
  rm -rf $DOTFILES_REPO
fi

git clone --bare git@github.com:emcorrales/dotfiles.git $DOTFILES_REPO

mkdir -p $DOTFILES_OLD
dotfiles checkout

if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
else
  echo "Backing up native dot files.";
  dotfiles checkout 2>&1 | grep -P "\t+" | awk {'print $1'} | xargs -I {} mv $HOME/{} $DOTFILES_OLD/
fi;

dotfiles checkout
dotfiles config status.showUntrackedFiles no


# Vundle setup
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Downloading and installing Vim plugins with Vundle..."
echo | echo | vim +PluginInstall +qall &>/dev/null
