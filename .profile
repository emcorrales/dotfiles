[ -f ~/.env ] && source ~/.env
[ -f ~/.work_profile ] && source ~/.work_profile

if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi
