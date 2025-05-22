#!/usr/bin/env zsh



# Install cocoapods
sudo gem install cocoapods

# Install brew
echo "› Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "› Installing brew bundle"
cd brew
brew bundle
cd ..

echo "› Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

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
mkdir -pv ~/Developer/Playground/c_playground
mkdir -pv ~/Developer/Playground/cpp_playground
mkdir -pv ~/Developer/Playground/rust_projects

# Install flutter
# Download the latest stable release of Flutter
echo "Downloading Flutter SDK..."
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.29.3-stable.zip

# Extract the downloaded zip file into ~/Developer/flutter
echo "Extracting Flutter SDK..."
unzip -j flutter_macos_3.29.3-stable.zip -d "$HOME/Developer"

# Clean up the zip file
echo "Cleaning up..."
rm flutter_macos_3.29.3-stable.zip

# Upgrade flutter
flutter upgrade

# Source file
cd ~ && source .zshrc

# Install flutter stacked_cli
dart pub global activate stacked_cli

clear

# To install useful key bindings and fuzzy completion:
echo "› Setup fzf"
$(brew --prefix)/opt/fzf/install

echo "› Done!!"
