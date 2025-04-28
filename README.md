### 安装

1. 将仓库`clone`到根目录`$HOME`下
2. 运行命令 `sh $HOME/sh/install.sh`

### 增加自定义alias

修改`$HOME/sh/alias/.gitconfig-alias`文件，alias会立即生效

### 增加自定义全局`shell`命令

#### 写法

具体写法参考`setNpmRegistry`

#### 可执行权限

记得设置可执行权限

```
chmod +x setNpmRegistry
```

#### 增加入口

根据实际路径设置
```
vim ~/.zshrc

export PATH=$PATH:~/sh
```

#### 参考文档

- [30 Bash Script Examples](https://linuxhint.com/30_bash_script_examples/)


### 添加hook
```
sh /path/to/repo/git-hooks/install.sh
sh /path/to/repo/git-hooks/uninstall.sh
```



### 远程安装 

生成github ssh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lizhengnacl/sh/master/generate-github-ssh.sh)"
sh -c "$(wget https://raw.githubusercontent.com/lizhengnacl/sh/master/generate-github-ssh.sh -O -)"
```

安装alias
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lizhengnacl/sh/master/set-alias.sh)"
sh -c "$(wget https://raw.githubusercontent.com/lizhengnacl/sh/master/set-alias.sh -O -)"
```