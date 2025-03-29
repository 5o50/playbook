# Nodejs: https://nodejs.org/en/about/previous-releases
active LTS: node22 

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm use --lts
nvm install stable
nvm use stable

nvm ls-remote
nvm ls
nvm current
