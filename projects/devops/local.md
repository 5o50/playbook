sudo apt update && sudo apt upgrade
mkdir ~/workspace

# gen keys 
ssh-keygen -t ed25519 -C "sofiane@baltaci.fr" -f ~/.ssh/github
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github
git clone git@github.com:thenewsocialapp/social.git

alias ..='cd ..'

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




