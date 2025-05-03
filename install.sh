#!/bin/bash

set -e

source ./utils.sh
source ./packages.conf

if ! command -v brew &>/dev/null; then
    step "Homebrew is not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.bash_profile
        eval "$(/usr/local/bin/brew shellenv)"
    fi

    green_echo "Homebrew installed!"
else
    green_echo "Homebrew is already installed."

    step "Updating Brew and packages"
    brew update
    brew upgrade
    brew cleanup
fi

step "Installing CLI/Utilities"
for package in "${CLIS[@]}"; do
    install_package "$package"
done

step "Installing Tools"
for package in "${TOOLS[@]}"; do
    install_package "$package"
done

step "Installing Languages Tools"
for package in "${LANGS[@]}"; do
    install_package "$package"
done

step "Installing Casks (like Discord, Chrome)"
for package in "${CASKS[@]}"; do
    install_cask "$package"
done

# Handle with dotfiles

echo -e "Setup complete!"
