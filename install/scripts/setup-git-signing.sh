#!/bin/bash
# SPDX-License-Identifier: MIT
# Script to enable GPG signing enforcement in a git repository

set -e

if [ ! -d ".git" ]; then
    echo "Error: Not in a git repository"
    exit 1
fi

hook_file=".git/hooks/pre-commit"
marker="# GPG signing enforcement"

# Check if already installed
if [ -f "$hook_file" ] && grep -q "$marker" "$hook_file"; then
    echo "✅ Git signing enforcement already enabled"
    exit 0
fi

# Create or append to existing hook
if [ -f "$hook_file" ]; then
    echo "" >> "$hook_file"
    echo "$marker" >> "$hook_file"
else
    echo "#!/bin/bash" > "$hook_file"
    echo "$marker" >> "$hook_file"
fi

cat >> "$hook_file" << 'EOF'
# Prevent unsigned commits
if ! git config --get user.signingkey >/dev/null 2>&1; then
    echo "Error: No GPG signing key configured"
    echo "  Set up GPG signing or use 'git commit -S'"
    exit 1
fi

if ! git config --get commit.gpgsign >/dev/null 2>&1 || [ "$(git config --get commit.gpgsign)" != "true" ]; then
    echo "Error: GPG signing not enabled"  
    echo "  Run 'git config commit.gpgsign true' or use 'git commit -S'"
    exit 1
fi
EOF

chmod +x "$hook_file"
echo "✅ Git signing enforcement enabled for this repository"