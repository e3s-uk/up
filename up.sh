#!/bin/bash

install_docker() {
    curl -sSL up.e3s.uk/install/docker.sh | bash
}

install_nvim() {
    sudo apt-get update
    sudo apt-get install neovim python3-pip
    pip3 install pynvim
}

install_rc() {
    curl -sSL up.e3s.uk/install/rc.sh | bash
}

# If no arguments are provided, install everything
if [[ $# -eq 0 ]]; then
    install_docker
    install_nvim
    install_rc
    exit 0
fi

# Loop through all characters of the argument
for (( i=0; i<${#1}; i++ )); do
    char="${1:$i:1}"
    case $char in
        d) install_docker ;;
        n) install_nvim ;;
        r) install_rc ;;
    esac
done
