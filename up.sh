#!/bin/bash

install_docker() {
    echo "Installing docker..."
    curl -sSL up.e3s.uk/install/docker.sh | bash
}

install_nvim() {
    echo "Installing Neovim..."
    sudo apt-get update
    sudo apt-get install neovim python3-pip -y
    pip3 install pynvim
}

install_rc() {
    echo "Adding additional run commands to .bashrc (via .rc.sh)"
    curl -sSL up.e3s.uk/install/rc.sh -o ~/.rc.sh
    # Append ~/.rc.sh to the end of ~/.bashrc if .rc.sh is not already present in the file:
    grep -qF '.rc.sh' ~/.bashrc || echo 'source ~/.rc.sh' >> ~/.bashrc
    # Source the script to apply its changes to the current environment as well
    source ~/.rc.sh
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
