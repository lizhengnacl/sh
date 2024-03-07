#!/bin/bash

copyFile() {
  sourceFilePath="$HOME/File/Obsidian/模板/沟通纪要.md"
  newFileName=$(date +"%Y%m%d_%H%M")
  newFilePath="$HOME/File/Obsidian/2. 工作/沟通纪要/沟通纪要_$newFileName.md"
  eval sourceFilePath="$sourceFilePath"
  cp "$sourceFilePath" "$newFilePath"
  echo "文件复制完成！"
}

copyToClipboard() {
  # 检查系统上是否安装pbcopy
  if command -v pbcopy >/dev/null; then
    echo "$1" | pbcopy
    echo "字符串已复制到剪切板！"
  else
    echo "错误：请确保系统上安装了pbcopy命令。"
    exit 1
  fi
}

copyFile

tips="[[沟通纪要_$newFileName]]"

copyToClipboard "$tips"
