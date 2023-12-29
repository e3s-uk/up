alias ll="ls -al"

# Add local Python install directory
export PATH="$HOME/.local/bin:$PATH"

t() {
    if tmux list-sessions &> /dev/null; then
        tmux attach
    else
        tmux
    fi
}

vi() {
    if command -v nvim >/dev/null 2>&1; then
        nvim "$@"
    else
        vim "$@"
    fi
}

mkcd() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: mkcd <directory>"
        return 1
    fi

    mkdir -p "$1" && cd "$1"
}

bold() {
    BOLD="\033[1m"
    RESET="\033[0m"
    echo -e "${BOLD}$1${RESET}"
}

chext() {
    # Change *.<old-extension> to *.<new-extension>
    
    # Check for correct number of arguments
    if [ "$#" -ne 2 ]; then
        echo "Usage: chext <old-extension> <new-extension>"
        return 1
    fi

    local old_ext="$1"
    local new_ext="$2"

    # Remove any leading dots from extensions
    old_ext="${old_ext#.}"
    new_ext="${new_ext#}"

    for file in *."$old_ext"; do
        # Check if file exists (in case no files match the old extension)
        if [ -e "$file" ]; then
            mv "$file" "${file%.$old_ext}.$new_ext"
        else
            echo "No files found with .$old_ext extension."
            break
        fi
    done
}
