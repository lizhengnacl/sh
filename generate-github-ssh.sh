#!/bin/bash

cd ~/.ssh
ssh-keygen -t ed25519 -C "lizhengnacl@163.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github
echo "github.pub添加到github https://github.com/settings/keys   ↓↓↓↓↓↓"
cat ~/.ssh/github.pub
echo "添加到github后：ssh -T git@github.com"
cd -

