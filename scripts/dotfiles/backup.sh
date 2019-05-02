#!/bin/bash -e

dotfiles() {
  git --git-dir=$DOTFILES_REPO --work-tree=$HOME $@
}

BACKUP_DIR=$DOTFILES_OLD/$(date +"%m-%d-%y-%T")/
mkdir -p $BACKUP_DIR

GIT_BRANCH=$(dotfiles rev-parse --abbrev-ref HEAD)

echo "Backing dotfiles to $BACKUP_DIR"
if [ -d $DOTFILES_REPO ]; then
  cd $HOME
  dotfiles ls-tree -r $GIT_BRANCH --name-only | xargs -I {} cp $HOME/{} $BACKUP_DIR
fi
