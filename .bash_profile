[ -f ~/.bashrc ] && source ~/.bashrc

# Load environment variables from .env.
if [ -f ~/.env ]; then
  . ~/.env
fi
