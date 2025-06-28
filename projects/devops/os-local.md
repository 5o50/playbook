sudo apt update && sudo apt upgrade
mkdir ~/workspace

# gen keys 
ssh-keygen -t ed25519 -C "sofiane@baltaci.fr" -f ~/.ssh/github
eval $(ssh-agent -s)
ssh-add ~/.ssh/github
git clone git@github.com:thenewsocialapp/social.git

```
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
```

pgrep -U "$USER" ssh-agent

# install keychain
sudo apt install keychain

# add to .bashrc
eval $(keychain --eval --timeout 60 --agents ssh ~/.ssh/github ~/.ssh/github555 ~/.ssh/ovh1 ~/.ssh/rpi)

##

sudo -u sophiechiro bash

# code & cursor IDE
code .
open cursor in windows and ctrl+shirt+p run "Shell Command: Install 'cursor' command"

###
install calibre for books

##
sudo apt install ledger
sudo apt install hledger hledger-ui hledger-web
sudo apt install python3-pip pipx
pipx install pricehist

ledger --version
hledger --version




