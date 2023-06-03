[ -f ~/.profile ] && source ~/.profile

if [ $(uname) = "Darwin" ]; then
  # Homebrew is installed on /opt/homebrew directory for Apple Silicon Macs.
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
