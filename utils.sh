#!/bin/bash

step() { echo -e "\033[1;34m$1\033[0m"; }
green_echo() { echo -e "\033[1;32m$1\033[0m"; }
# red_echo() { echo -e "\033[31m$1\033[0m"; }

installed() { echo -e "$1 \033[1;32minstalled\033[0m"; }

is_installed() {
    brew list "$1" &>/dev/null
}

install_package() {
    if ! is_installed "$1"; then
        echo -e "→ Installing $1..."
        brew install "$1"
    else
        installed "$1"
    fi
}

install_cask() {
    if ! is_installed "$1"; then
        echo -e "→ Installing $1..."
        brew install --cask "$1"
    else
        installed "$1"
    fi
}

