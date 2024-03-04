#!/bin/bash

# 路径到您的函数文件
FUNCTIONS_LIB_DIR="$HOME/sh/functions/lib"

# 加载所有函数文件，剔除名称为install.sh和auto.sh的文件
for file in $FUNCTIONS_LIB_DIR/*; do
    filename=$(basename "$file")
    if [ -f "$file" ] && [ "$filename" != "install_autoload.sh" ] && [ "$filename" != "autoload.sh" ]; then
        chmod +x "$file"
    fi
done
