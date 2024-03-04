#!/bin/bash

MAIN_CONFIG_FILE="$HOME/.gitconfig"
ALIAS_FILE_PATH=$(eval echo "$HOME/sh/alias/.gitconfig-alias")

# 检查.gitconfig-alias文件是否存在
if [ -f $ALIAS_FILE_PATH ]; then
    echo "[include]" >> $MAIN_CONFIG_FILE
    echo "    path = $ALIAS_FILE_PATH" >> $MAIN_CONFIG_FILE

    echo "Git alias安装完成！"
else
    echo ".gitconfig-alias文件不存在，请先运行configure_git_alias.sh脚本配置alias。"
fi
