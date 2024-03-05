#!/bin/bash

# Path to the hooks repository
HOOKS_REPO_PATH="/Users/didi/sh/git-hooks/hooks"

# Function to install hook scripts
install_hooks() {
    for hook_script in "$HOOKS_REPO_PATH"/*
    do
        if [ -f "$hook_script" ]; then
            hook_name=$(basename "$hook_script")
            ln -s "$hook_script" "$PWD/.git/hooks/$hook_name"
            echo "Installed $hook_name hook script."
        fi
    done
}

# Check if .git/hooks directory exists
if [ -d "$PWD/.git/hooks" ]
then
    install_hooks
    echo "Hooks installation completed."
else
    echo "Error: .git/hooks directory not found. Make sure you are in a Git repository."
    exit 1
fi
