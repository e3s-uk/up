alias ll="ls -al"

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
