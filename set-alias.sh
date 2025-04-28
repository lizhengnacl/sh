#!/bin/bash

# 定义要添加的内容（可修改）
CUSTOM_CONFIG='
alias test="ls -alFh"
alias ll="ls -la"
alias gs="git status"
alias gp="git pull
alias gcm="git ac"
alias pwd="pwd | pbcopy"
alias idea="open -a webstorm"
'

# 检查.bashrc文件是否存在
TARGET_FILE="$HOME/.bashrc"
BACKUP_FILE="$HOME/.bashrc.bak"

if [ ! -f "$TARGET_FILE" ]; then
    echo "警告: $TARGET_FILE 不存在，将创建新文件"
    touch "$TARGET_FILE"
fi

# 检查是否已存在相同配置
if grep -q "==== 自定义配置开始 ====" "$TARGET_FILE"; then
    echo "检测到已存在自定义配置，将跳过添加"
    exit 1
fi

# 创建备份
cp "$TARGET_FILE" "$BACKUP_FILE"
echo "已创建备份文件: $BACKUP_FILE"

# 追加配置到文件末尾
echo "$CUSTOM_CONFIG" >> "$TARGET_FILE"

echo "添加完成，请重新加载.bashrc，参考 source ~/.bashrc"