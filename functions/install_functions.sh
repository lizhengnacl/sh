#!/bin/bash

# 设置functions目录的路径
FUNCTIONS_DIR="$HOME/sh/functions"

# 检查functions目录是否存在
if [ -d "$FUNCTIONS_DIR" ]; then
    # 添加functions目录到PATH
    if [[ ":$PATH:" != *":$FUNCTIONS_DIR:"* ]]; then
        export PATH="$FUNCTIONS_DIR/lib:$PATH"
        echo "Functions directory added to PATH"
    else
        echo "Functions directory already in PATH"
    fi

    # 执行同级目录下的autoload.sh
    autoload_script="$FUNCTIONS_DIR/autoload.sh"
    if [ -f "$autoload_script" ]; then
        source "$autoload_script"
        echo "autoload.sh executed"
    else
        echo "autoload.sh not found"
    fi

    # 添加脚本到.bashrc
    if ! grep -q "source $FUNCTIONS_DIR/install_functions.sh" ~/.bashrc; then
        echo "source $FUNCTIONS_DIR/install_functions.sh" >> ~/.bashrc
        echo "install_functions.sh added to .bashrc"
    else
        echo "install_functions.sh already in .bashrc"
    fi
else
    echo "Functions directory not found"
fi
