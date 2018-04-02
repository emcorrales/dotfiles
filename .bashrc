# Load environment variables from .env.
if [ -f ~/.env ]; then
  . ~/.env
fi

# Load aliases form .aliases.
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi
