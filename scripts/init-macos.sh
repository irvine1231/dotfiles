#!/bin/bash
#
# bootstrap installs things.
#
# Reference: https://github.com/amowu/dotfiles/blob/master/script/bootstrap
#

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)
source $DOTFILES_ROOT/scripts/lib.sh

set -x

echo ''

# Function: install_ohmyzsh()
#
install_ohmyzsh () {
  if [ ! -d ~/.oh-my-zsh ]
  then
    info '  Installing oh-my-zsh'
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    success '  Installed oh-my-zsh'
  fi
}

# Function: install_powerlevel10k()
#
install_powerlevel10k () {
  if [ -d ~/.oh-my-zsh ]
  then
    info '  Installing powerlevel10k'
    sh -c "$(brew install romkatv/powerlevel10k/powerlevel10k)"
    success '  Installed powerlevel10k'
  fi
}

# Function: init nvm
#
init_nvm () {
  if [ ! -d ~/.nvm ]
  then
    info '  Init nvm'
    mkdir ~/.nvm
    success '  Inited nvm'
  fi
}

# Main
#
install_ohmyzsh
install_powerlevel10k
init_nvm

echo ''
success '  All installed!'