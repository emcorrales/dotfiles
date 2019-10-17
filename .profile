[ -f ~/.env ] && source ~/.env
[ -f ~/.work_profile ] && source ~/.work_profile

if [ -d $RVM_ROOT ]; then
  # Load RVM into a shell session *as a function*
  [[ -s "$RVM_ROOT/scripts/rvm" ]] && source "$RVM_ROOT/scripts/rvm"
elif [ -d $RBENV_ROOT ]; then
  # Initilaze rbenv.
  if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
  fi
fi

if [ -d $PYENV_ROOT ]; then
  # Initilaze pyenv.
  if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
  fi
fi
