Dot Files
======
My configuration files for Mac and Linux. This project was built for my personal
use. You may take whatever you want but at your own risk. I cannot guarantee
that it won't mess up your configurations. This has been tested to work on OSX
High Sierra and Ubuntu 16.04.

Setup SSH keys
------
```bash
ssh-keygen -t ed25519 -C "contact@emcorrales.com"
```
Copy ssh keys to clipboard.
- MacOS:
```bash
pbcopy < ~/.ssh/id_ed25519.pub
```
- Linux:
```bash
cat ~/.ssh/id_ed25519.pub | xclip
```
- Windows (Git Bash/WSL):
```bash
cat ~/.ssh/id_ed25519.pub | clip
```

Installation
------
Execute the following commands in your terminal.
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/emcorrales/dotfiles/master/scripts/setup/dotfiles.sh)"
```
