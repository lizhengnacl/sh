#!/bin/bash

# Path to the hooks repository
current_file_absolut_path=$(readlink -f "$0")
HOOKS_REPO_PATH=$(dirname $current_file_absolut_path)/hooks/
#echo "HOOKS_REPO_PATH: $HOOKS_REPO_PATH"

# Function to install hook scripts
uninstall_hooks() {
    for hook_script in "$HOOKS_REPO_PATH"/*
    do
        if [ -f "$hook_script" ]; then
            hook_name=$(basename "$hook_script")
            if [ "$hook_name" = "pre-commit" ]; then
                rm "$PWD/.git/hooks/$hook_name"
                echo "uninstall $hook_name hook script."
            fi
        fi
    done
}

# Check if .git/hooks directory exists
if [ -d "$PWD/.git/hooks" ]
then
    uninstall_hooks
    echo "Hooks installation completed."
else
    echo "Error: .git/hooks directory not found. Make sure you are in a Git repository."
    exit 1
fi
