#!/bin/sh

# Cache sudo
sudo -v

# Install and source ohmyzsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
cp ./zsh/.zshrc ~/
source ~/.zshrc

# Install and source Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source ~/.zshrc

# Install all my packages
brew bundle install --file=./Brewfile
source ~/.zshrc

################### DISCLAIMER ###################
# I don't like to install this packages outside  #
# Homebrew, see in the future a another way to   #
# make lsp of ocaml and wasm compilation in rust #
# working using Homebrew.                        #
##################################################

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.zshrc

# Install ocaml
bash -c "sh <(curl -fsSL https://opam.ocaml.org/install.sh)"
source ~/.zshrc
opam init
opam install ocaml-lsp-server odoc ocamlformat utop
source ~/.zshrc

# Install Xcode
mas install 497799835

# Install xcode command line tools
xcode-select --install

# Copy my configs
cp -r ./* ~/.config

# Apply bat themes
bat --list-themes

# Agree to rosetta
softwareupdate --install-rosetta --agree-to-license

# Intall node via nvm
nvm install node

# Install zsh history inquirer
npm i -g zsh-history-enquirer

# Apply fast synthax highlight theme
fast-theme XDG:catppuccin-frappe

# Start brew services to autostart borders
brew services start borders

# Change dock size to 42
defaults write com.apple.dock "tilesize" -int "42" && killall Dock

# Source and print finished
source ~/.zshrc
echo "Finished Installation"
