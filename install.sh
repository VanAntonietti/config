#!/bin/sh

#l Install and source ohmyzsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
cp ./zsh/.zshrc ~/
source ~/.zshrc

# Install and source Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source ~/.zshrc

# Install all my packages
brew bundle install --file=./Brewfile
source ~/.zshrc

# Copy my configs
cp -r ./* ~/.config
