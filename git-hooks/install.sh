#!/bin/bash

# Path to the hooks repository
current_file_absolut_path=$(readlink -f "$0")
HOOKS_REPO_PATH=$(dirname $current_file_absolut_path)/hooks/
#echo "HOOKS_REPO_PATH: $HOOKS_REPO_PATH"

# Function to install hook scripts
install_hooks() {
    for hook_script in "$HOOKS_REPO_PATH"/*
    do
        if [ -f "$hook_script" ]; then
            hook_name=$(basename "$hook_script")
            # 添加可执行权限
            chmod +x "$hook_script"
            if [ "$hook_name" = "pre-commit" ]; then
                ln -s "$hook_script" "$PWD/.git/hooks/$hook_name"
                echo "Installed $hook_name hook script."
            fi
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
