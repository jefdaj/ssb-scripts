#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# install debian dependencies
sudo apt-get install -y g++ m4 libtool automake libgconf-2-4 \
  libxext-dev libxtst-dev libxkbfile-dev

# install node version manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# install nodejs
nvm install 8

# build patchwork
git clone https://github.com/ssbc/patchwork.git $HOME/patchwork
cd $HOME/patchwork
npm install

# open a site for a pub invite
xdg-open 'http://ssb.learningsocieties.org/' &

# TODO desktop launcher? install this in ~/bin?
. "$SCRIPT_DIR"/patchwork-run.sh
