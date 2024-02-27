#!/usr/bin/env zsh

# Install brew
echo "› Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "› Installing brew bundle"
cd brew
brew bundle
cd ..

# Initail stow path
stow zsh

# Include all stow
./stow_all.sh

# ============================= Additional Config =============================
# Install Rust
echo "› Installing rustup"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Toml language server
echo "› Installing toml language server"
cargo install taplo-cli --locked --features lsp
# Install rust_analyzer
rustup component add rust-src


# Setup development path
echo "› Setup my workspaces"
mkdir -pv ~/Developer/Work
mkdir -pv ~/Developer/Playground
# Install flutter stacked_cli
dart pub global activate stacked_cli

# Source file
cd ~ && source .zshrc
clear

# To install useful key bindings and fuzzy completion:
echo "› Setup fzf"
$(brew --prefix)/opt/fzf/install

echo "› Done!!"


