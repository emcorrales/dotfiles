git clone --bare https://github.com/EmmanuelCorrales/dotfiles.git $HOME/.dotfiles

DOTFILES_HOME=$HOME/.dotfiles
DOTFILES_OLD=$HOME/.dotfiles.old/`date +"%m-%d-%y-%T"`

function dotfiles {
  git --git-dir=$DOTFILES_HOME --work-tree=$HOME $@
}

mkdir -p $DOTFILES_OLD
dotfiles checkout

if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
else
  echo "Backing up pre-existing dot files.";
  dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I {} mv $HOME/{} $BACKUP_DIR/{}
fi;

dotfiles checkout
dotfiles config status.showUntrackedFiles no